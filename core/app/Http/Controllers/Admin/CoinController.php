<?php

namespace App\Http\Controllers\Admin;

use App\Models\Gateway;
use App\Models\GeneralSetting;
use App\Http\Controllers\Controller;
use App\Models\Cryptotrx;
use App\Models\Currency;
use App\Models\Cryptowallet;
use App\Models\GatewayCurrency;
use App\Models\Transaction;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CoinController extends Controller
{



    public function currency()
    {
        $pageTitle = 'Manage Cryptocurrency';
        $emptyMessage = 'No Coin.';
        $currency = Currency::all();
        return view('admin.currency.index', compact('pageTitle', 'emptyMessage', 'currency'));
    }

     public function activate($id)
    {
        $general_setting = GeneralSetting::first();
        $page_title = 'Currency Settings';
        $currency = Currency::whereId($id)->first();

        if (!$currency){
		 $notify[] = ['error', 'Invalid Currency. Contact server admin'];
            return back()->withNotify($notify);
         }
         else{
         $currency->status = 1;
         $currency->save();
         $notify[] = ['success', 'Cryotocurrency Activated'];
         return back()->withNotify($notify);
         }

    }

     public function deactivate($id)
    {
        $general_setting = GeneralSetting::first();
        $page_title = 'Currency Settings';
        $currency = Currency::whereId($id)->first();

        if (!$currency){
		 $notify[] = ['error', 'Invalid Currency. Contact server admin'];
         return back()->withNotify($notify);
         }
         else{
         $currency->status = 0;
         $currency->save();
         $notify[] = ['success', 'Cryotocurrency Deactivated'];
         return back()->withNotify($notify);
         }

    }

     public function edit($id)
    {
       $general_setting = GeneralSetting::first();

        $general_setting = GeneralSetting::first();
         $pageTitle  = 'Currency Settings';
        $currency = Currency::whereId($id)->first();

        if (!$currency){
		 $notify[] = ['error', 'Invalid Currency. Contact server admin'];
            return back()->withNotify($notify);
         }
         else{
          return view('admin.currency.edit', compact('currency','pageTitle', 'general_setting'));
         }

    }

      public function apiupdate(Request $request, $id)
    {
    $general_setting = GeneralSetting::first();

         $request->validate([
            'apikey' => 'required',
            'apipass' => 'required',
        ]);

        $currency = Currency::whereId($id)->first();

        if (!$currency){
		 $notify[] = ['error', 'Invalid Currency. Contact server admin'];
            return back()->withNotify($notify);
         }
         else{
         $currency->apikey = $request->apikey;
         $currency->apipass = $request->apipass;
         $currency->save();
          $notify[] = ['success', $currency->name.' API Credentials Updated Successfully'];
            return back()->withNotify($notify);
         }

    }



    public function swap()
    {
        $pageTitle = 'Coin Swap';
        $emptyMessage = 'No Swap Log.';
        $log = Cryptotrx::whereType('swap')->get();
        return view('admin.wallet.swap', compact('pageTitle', 'emptyMessage', 'log'));
    }

      public function wallet()
    {
        $pageTitle = 'Select Currency';
        $emptyMessage = 'No Currency Log.';
        $currency = Currency::whereCanwallet(1)->get();
        return view('admin.wallet.currency', compact('pageTitle', 'emptyMessage', 'currency'));
    }

     public function viewwallet($id)
    {
        $currency = Currency::whereSymbol($id)->first();
        $wallets = Cryptowallet::whereCoin_id($currency->id)->get();
        $unit = Cryptowallet::whereCoin_id($currency->id)->sum('balance');
        $pageTitle = $currency->name.' Wallet';
        $user = User::all();

        $general = GeneralSetting::first();
        $baseurl = "https://coinremitter.com/api/v3/get-coin-rate";
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $baseurl,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => '',
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => 'GET',
		  CURLOPT_POSTFIELDS => array('api_key' => $currency->apikey,'password' => $currency->apipass,'fiat_amount' => 1,'fiat_symbol' => 'USD'),
		));

		$response = curl_exec($curl);
		$reply = json_decode($response,true);
		curl_close($curl);
		//return $response;

		if (!isset($reply['msg'])){
		 $notify[] = ['error', 'An error occur. Contact server admin'];
            return back()->withNotify($notify);
         }
         if ($reply['msg'] != 'success'){
		 $notify[] = ['error', 'An error occur. Contact server admin'];
            return back()->withNotify($notify);
         }
         $rate = $reply['data'][$currency->symbol]['price'];
         $usd = $rate * $unit;
         foreach ($wallets as $dataw)
        {
         $usdrate = $rate * $dataw->balance;
         $dataw->usd = $usdrate;
         $dataw->save();
        }

        return view('admin.wallet.wallets', compact('user','pageTitle','currency','wallets','unit','rate','usd'));
      }


        public function activatewallet($id)
    {
        $general_setting = GeneralSetting::first();
        $wallet = Cryptowallet::whereAddress($id)->first();

        if (!$wallet){
		 $notify[] = ['error', 'Invalid Wallet. Contact server admin'];
            return back()->withNotify($notify);
         }
         else{
         $wallet->status = 1;
         $wallet->save();
          $notify[] = ['success', 'Wallet Activated'];
            return back()->withNotify($notify);
         }

    }

     public function deactivatewallet($id)
    {
        $general_setting = GeneralSetting::first();
        $wallet = Cryptowallet::whereAddress($id)->first();

        if (!$wallet){
		 $notify[] = ['error', 'Invalid Wallet. Contact server admin'];
            return back()->withNotify($notify);
         }
         else{
         $wallet->status = 0;
         $wallet->save();
          $notify[] = ['success', 'Wallet Deactivated'];
            return back()->withNotify($notify);
         }

    }

      public function createwallet(Request $request, $id)
       {
        $this->validate($request, [
            'label' => 'required|max:10',
            'user' => 'required',
        ]);
        $currency = Currency::where('status', '!=', 0)->whereCanwallet(1)->whereSymbol($id)->first();
        $walletcount = Cryptowallet::where('user_id', $request->user)->whereCoin_id($currency->id)->whereLabel($request->label)->where('status', 1)->count();
        if($walletcount > 0){
         $notify[] = ['error', 'User already have a '.$currency->name.' wallet with this label. Please try another label'];
            return back()->withNotify($notify);
        }
        $general = GeneralSetting::first();
        $label = $request->label;;
        $baseurl = "https://coinremitter.com/api/v3/".$currency->symbol."/get-new-address";
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $baseurl,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => '',
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => 'POST',
		  CURLOPT_POSTFIELDS => array('api_key' => $currency->apikey,'password' => $currency->apipass,'label' => $label),
		));

		$response = curl_exec($curl);
		$reply = json_decode($response,true);
		curl_close($curl);
		//return $response;

		 if (!isset($reply['flag'])){
		 $notify[] = ['error', 'An error occur. Contact server admin'];
            return back()->withNotify($notify);
         }
         if ($reply['flag'] != '1'){
		 $notify[] = ['error', 'An error occur. Contact server admin'];
            return back()->withNotify($notify);
         }
         $address = $reply['data']['address'];
         $qrcode = $reply['data']['qr_code'];

         $w['user_id'] = $request->user;
         $w['address'] = $address;
         $w['qrcode'] = $qrcode;
         $w['coin_id'] = $currency->id;
         $w['label'] = $label;
         $w['balance'] = 0;
         $w['status'] = 1;
         $result = Cryptowallet::create($w);

         if($result){
         $notify[] = ['success', 'Your new '.$currency->name.' wallet has been created successfully.'];
         return back()->withNotify($notify);
            }


    }



     public function creditwallet(Request $request, $id)
    {
         $request->validate([
            'amount' => 'required|integer'
        ]);

         $wallet = Cryptowallet::whereAddress($id)->first();
        if(!$wallet){
         $notify[] = ['error', 'Wallet not found'];
            return back()->withNotify($notify);
        }

         else{
         $wallet->balance += $request->unit;
         $wallet->usd += $request->amount;
         $wallet->save();
          $notify[] = ['success', 'Wallet Credited Successfully'];
            return back()->withNotify($notify);
         }

    }


     public function debitwallet(Request $request, $id)
    {
         $request->validate([
            'amount' => 'required|integer'
        ]);

         $wallet = Cryptowallet::whereAddress($id)->first();
        if(!$wallet){
         $notify[] = ['error', 'Wallet not found'];
            return back()->withNotify($notify);
        }

         else{
         $wallet->balance = $wallet->balance - $request->unit;
         $wallet->usd  = $wallet->usd - $request->amount;
         $wallet->save();
          $notify[] = ['success', 'Wallet Debited Successfully'];
            return back()->withNotify($notify);
         }

    }

      public function viewwalletaddress($id)
    {
        $pageTitle = 'View Wallet';
        $wallet = Cryptowallet::where('address', $id)->first();
         if(!$wallet){
         $notify[] = ['error', 'Invalid Wallet or Wallet Not Found'];
            return back()->withNotify($notify);
         }
        $currency = Currency::where('id', $wallet->coin_id)->where('status', 1)->whereCanwallet(1)->first();
         if(!$currency){
         $notify[] = ['error', 'Invalid Currency or Currency Not Found'];
            return back()->withNotify($notify);
         }

          $baseurl = "https://coinremitter.com/api/v3/".$currency->symbol."/get-transaction-by-address";
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $baseurl,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => '',
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 0,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => 'POST',
		  CURLOPT_POSTFIELDS => array('api_key' => $currency->apikey,'password' => $currency->apipass,'address' => $wallet->address),
		));

		$response = curl_exec($curl);
		$reply = json_decode($response,true);
		curl_close($curl);
		//return $response;

         $general = GeneralSetting::first();
         $sent = Cryptotrx::where('address', $id)->orderby('id','desc')->where('type', 'send')->get();
         $received = Cryptotrx::where('user_id', auth()->id())->where('address', $id)->orderby('id','desc')->whereType('receive')->get();
         //$trx = $reply['data'];
         $tsent = Cryptotrx::where('address', $id)->orderby('id','desc')->where('type', 'send')->sum('usd');
         $tsentunit = Cryptotrx::where('address', $id)->orderby('id','desc')->where('type', 'send')->sum('amount');
         $trec = Cryptotrx::where('address', $id)->orderby('id','desc')->whereType('receive')->sum('usd');
         $trecunit = Cryptotrx::where('address', $id)->orderby('id','desc')->whereType('receive')->sum('amount');
         $total = Cryptotrx::where('address', $id)->orderby('id','desc')->sum('usd');
         $totalunit = Cryptotrx::where('address', $id)->orderby('id','desc')->sum('amount');
        return view('admin.wallet.view-wallet', compact('pageTitle','currency','sent','wallet','received','tsent','trec','tsentunit','trecunit','total','totalunit'));
    }

}
