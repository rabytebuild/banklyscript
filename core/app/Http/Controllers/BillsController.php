<?php

namespace App\Http\Controllers;

use App\Lib\GoogleAuthenticator;
use App\Models\AdminNotification;
use App\Models\GeneralSetting;
use App\Models\Transaction;
use App\Models\WithdrawMethod;
use App\Models\Power;
use App\Models\Deposit;
use App\Models\Network;
use App\Models\Bill;
use App\Models\Internetbundle;
use App\Models\Cabletvbundle;
use App\Rules\FileTypeValidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Carbon\Carbon;
use Session;

class BillsController extends Controller
{
    public function __construct()
    {
        $this->activeTemplate = activeTemplate();
    }

    public function airtime()
    {
        $pageTitle = 'Airtime Recharge';
        $user = Auth::user();
        $network = Network::whereAirtime(1)->get();
        $bills = Bill::whereUserId($user->id)->whereType(1)->get();

        return view($this->activeTemplate . 'user.bills.airtime', compact(
            'pageTitle',
            'network',
            'bills',
            'user'
        ));
    }

     public function airtimebuy(Request $request)
    {
        $this->validate($request, [
            'phone' => 'required|numeric',
            'network' => 'required',
            'amount' => 'required|numeric|min:50',

        ]);
        $user = Auth::user();
        $network = Network::whereSymbol($request->network)->first();

        if(!$network)
        {
         return back()->with('danger', 'Invalid Network');
        }

        if ($user->balance < $request->amount)
        {
         $notify[] = ['error', 'You dont have enough balance to start this transcation.'];
         return back()->withNotify($notify);
        }


        $mode = env('MODE');
        $username = env('VTPASSUSERNAME');
        $password = env('VTPASSPASSWORD');
        $str = $username.':'.$password;
        $auth = base64_encode($str);

$trx = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890') , 0 , 10 );
 if($mode == 0)
        {
        $url = 'https://sandbox.vtpass.com/api/pay';
        }
        else
        {
        $url = 'https://vtpass.com/api/pay';
        }
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>'{
        "amount": "'.$request->amount.'",
        "phone": "'.$request->phone.'",
        "serviceID": "'.$request->network.'",
        "request_id": "'.$trx.'"
        }',
      CURLOPT_HTTPHEADER => array(
    'Authorization: Basic '.$auth,
    'Content-Type: application/json',
      ),
    ));

    $resp = curl_exec($curl);
    $reply = json_decode($resp, true);
    curl_close($curl);
    if(!isset($reply['code'] )) 
    {
    $notify[] = ['warning', 'Sorry, We cant proceed with this payment at the moment. Please try again later'];
    return back()->withNotify($notify);
    }
    
    
    
    if(isset($reply['content']['errors'] )) 
    {
    $notify[] = ['warning', 'API '.$reply['content']['errors']];
    return back()->withNotify($notify);
    }
   

    if($reply['code'] != "000") 
    {
    $notify[] = ['warning', 'Sorry, We cant process this payment at the moment'];
    return back()->withNotify($notify);
    }
    
    
     if(!isset($reply['content']['transactions']['transactionId']))
    {
        $notify[] = ['error', 'Sorry, We cant process tbis payment at the moment'];
            return back()->withNotify($notify); 
    }

     if($reply['code'] == 000)
     {
        	$user->balance -= $request->amount;
            $user->save();

            $transaction = new Bill();
            $transaction->user_id = $user->id;
            $transaction->amount = $request->amount;
            $transaction->trx = getTrx();
            $transaction->phone = $request->phone;
            $transaction->network = $request->network;
            $transaction->newbalance = $user->balance;
            $transaction->type = 1;
            $transaction->status = 1;
            $transaction->save();
          $notify[] = ['success', 'Airtime Recharge Was Successful'];
            return back()->withNotify($notify);

     }

     }


       public function internet()
    {
        $pageTitle = 'Internet Data Recharge';
        $user = Auth::user();
        $network = Network::whereInternet(1)->get();
        $bills = Bill::whereUserId($user->id)->whereType(2)->get();
        $bill = Internetbundle::whereStatus(1)->get();

        return view($this->activeTemplate . 'user.bills.internet', compact(
            'pageTitle',
            'network',
            'bills',
            'bill',
            'user'
        ));
    }


      public function loadinternet(Request $request)
    {
       $request->validate([
            'phone' => 'required|string|min:11|',
            'network' => 'required|string|',
            'plan' => 'required',

        ]);

        $settings = GeneralSetting::first();

        $network  = Network::whereAirtime(1)->whereSymbol($request->network)->first();
        $internet  = Internetbundle::wherePlan($request->plan)->first();
        $mode = env('MODE');
        $username = env('VTPASSUSERNAME');
        $password = env('VTPASSPASSWORD');
        $str = $username.':'.$password;
        $auth = base64_encode($str);

        $user = Auth::user();
        if ($internet->cost > $user->balance)
        {
         $notify[] = ['error', 'You dont have enough balance to start this transaction.'];
         return back()->withNotify($notify);
        }


        if($mode == 0)
        {
        $url = 'https://sandbox.vtpass.com/api/pay';
        }
        else
        {
        $url = 'https://vtpass.com/api/pay';
        }
        $code = getTrx();
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>'{
        "amount": "'.$request->amount.'",
        "phone": "'.$request->phone.'",
        "billersCode": "'.$request->phone.'",
        "serviceID": "'.$internet->code.'",
        "variation_code": "'.$internet->plan.'",
        "request_id": "'.$code.'"
        }',
      CURLOPT_HTTPHEADER => array(
    'Authorization: Basic '.$auth,
    'Content-Type: application/json',
      ),
    ));

    $resp = curl_exec($curl);
    $reply = json_decode($resp, true);
    curl_close($curl);
    //return  $resp;

    if(!isset($reply['code'] )) 
    {
    $notify[] = ['warning', 'Sorry, We cant proceed with this payment at the moment. Please try again later'];
    return back()->withNotify($notify);
    }
    
    
    
    if(isset($reply['content']['errors'] )) 
    {
    $notify[] = ['warning', 'API '.$reply['content']['errors']];
    return back()->withNotify($notify);
    }
   

    if($reply['code'] != "000") 
    {
    $notify[] = ['warning', 'Sorry, We cant process this payment at the moment'];
    return back()->withNotify($notify);
    }
    
    
     if(!isset($reply['content']['transactions']['transactionId']))
    {
        $notify[] = ['error', 'Sorry, We cant process tbis payment at the moment'];
            return back()->withNotify($notify); 
    }

    if($reply['code']== 000) {

    $user->balance -= $internet->cost;
    $user->save();

            $transaction = new Bill();
            $transaction->user_id = $user->id;
            $transaction->amount = $internet->cost;
            $transaction->trx = getTrx();
            $transaction->phone = $request->phone;
            $transaction->network = $request->network;
            $transaction->accountname = $internet->name;
            $transaction->newbalance = $user->balance;
            $transaction->type = 2;
            $transaction->status = 1;
            $transaction->save();
          $notify[] = ['success', 'Internet Subscription Was Successful'];
            return back()->withNotify($notify);


    }


    }


         public function cabletv()
    {
        $pageTitle = 'Cable TV Subscription';
        $user = Auth::user();
        $network = Network::whereTv(1)->get();
        $bills = Bill::whereUserId($user->id)->whereType(3)->get();

        $bill = Cabletvbundle::whereStatus(1)->get();

        return view($this->activeTemplate . 'user.bills.cabletv', compact(
            'pageTitle',
            'network',
            'bills',
            'bill',
            'user'
        ));
    }


    public function validatedecoder(Request $request)
     {
       $request->validate([
            'number' => 'required',
            'decoder' => 'required|string|',
            'plan' => 'required',

        ]);

        $settings = GeneralSetting::first();

        $decoder  = Cabletvbundle::wherePlan($request->plan)->first();
        $mode = env('MODE');
        $username = env('VTPASSUSERNAME');
        $password = env('VTPASSPASSWORD');
        $str = $username.':'.$password;
        $auth = base64_encode($str);

        $user = Auth::user();
        $total = $decoder->cost + env('CABLECHARGE');
         if ($total > $user->balance) {
            $notify[] = ['error', 'Insufficient Balance'];
            return back()->withNotify($notify);
        }

        if($mode == 0)
        {
        $url = 'https://sandbox.vtpass.com/api/merchant-verify';
        }
        else
        {
        $url = 'https://vtpass.com/api/merchant-verify';
        }

        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>'{
         "billersCode": "'.$request->number.'",
        "serviceID": "'.$decoder->code.'"
        }',
      CURLOPT_HTTPHEADER => array(
    'Authorization: Basic '.$auth,
    'Content-Type: application/json',
      ),
    ));

    $resp = curl_exec($curl);
    $reply = json_decode($resp, true);
    curl_close($curl);
    //return  $resp;

    if(!isset($reply['code'] )) 
    {
    $notify[] = ['warning', 'Sorry, We cant proceed with this payment at the moment. Please try again later'];
    return back()->withNotify($notify);
    }
    
    
    
    if(isset($reply['content']['errors'] )) 
    {
    $notify[] = ['warning', 'API '.$reply['content']['errors']];
    return back()->withNotify($notify);
    }
   
 

    if($reply['code'] != 000) {
    $notify[] = ['warning', 'Sorry, We cant validate this decoder/IUC number at the moment'];
    return back()->withNotify($notify);
    }

    if($reply['code']== 000) {
    Session::put('customer', $reply['content']['Customer_Name']);
    Session::put('number', $request->number);
    Session::put('planname', $decoder->name);
    Session::put('plancode', $request->plan);
    Session::put('decoder', $decoder->network);
    Session::put('cost', $decoder->cost);
    return redirect()->route('user.decodervalidated');
    }


    }



     public function decodervalidated(){

        $settings = GeneralSetting::first();
        $customer = Session::get('customer');
        $planname = Session::get('planname');
        $number = Session::get('number');
        $plancode = Session::get('plancode');
        $decoder = Session::get('decoder');
        $cost = Session::get('cost');

        $pageTitle = "Cable TV Validation";
        return view($this->activeTemplate . 'user.bills.tv-validated', compact('pageTitle','customer','planname','number','plancode','decoder','cost'));
    }


     public function decoderpay(Request $request)
    {
       $request->validate([
            'number' => 'required',
            'customer' => 'required',

        ]);


        $decoder  = Cabletvbundle::wherePlan($request->plan)->first();


        $user = Auth::user();
         $total = $decoder->cost + env('CABLECHARGE');
         if ($total > $user->balance) {
            $notify[] = ['error', 'Insufficient Balance'];
            return back()->withNotify($notify);
        }
       $mode = env('MODE');
        $username = env('VTPASSUSERNAME');
        $password = env('VTPASSPASSWORD');
        $str = $username.':'.$password;
        $auth = base64_encode($str);


        if($mode == 0)
        {
        $url = 'https://sandbox.vtpass.com/api/pay';
        }
        else
        {
        $url = 'https://vtpass.com/api/pay';
        }
        $code = getTrx();
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>'{
         "billersCode": "'.$request->number.'",
         "variation_code": "'.$request->plan.'",
         "phone": "'.$user->mobile.'",
        "serviceID": "'.$decoder->code.'",
        "request_id": "'.$code.'"
        }',
      CURLOPT_HTTPHEADER => array(
    'Authorization: Basic '.$auth,
    'Content-Type: application/json',
      ),
    ));

    $resp = curl_exec($curl);
    $reply = json_decode($resp, true);
    curl_close($curl);
    //return  $resp;

    if($reply['code'] != 000) {
    $notify[] = ['warning', 'Sorry, We cant process this payment at the moment'];
    return back()->withNotify($notify);
    }

    if($reply['code']== 000) {


      $user->balance -= $total;
      $user->save();


            $transaction = new Bill();
            $transaction->user_id = $user->id;
            $transaction->amount = $decoder->cost;
            $transaction->trx = getTrx();
            $transaction->phone = $request->number;
            $transaction->network = $decoder->network;
            $transaction->plan = $decoder->name;
            $transaction->accountname = $request->customer;
            $transaction->newbalance = $user->balance;
            $transaction->type = 3;
            $transaction->status = 1;
            $transaction->save();

    $notify[] = ['success', 'Payment Was Successfully'];
    return redirect()->route('user.cabletv')->withNotify($notify);
    }


    }



         public function utility()
    {
        $pageTitle = 'Utility Bills Payment';
        $user = Auth::user();
        $bills = Bill::whereUserId($user->id)->whereType(4)->latest()->get();
        $network = Power::whereStatus(1)->get();
        return view($this->activeTemplate . 'user.bills.utility', compact(
            'pageTitle',
            'network',
            'bills',
            'network',
            'user'
        ));
    }




    public function validatebill(Request $request)
    {
       $request->validate([
            'number' => 'required',
            'company' => 'required|string|',
            'type' => 'required',
            'amount' => 'required|integer|min:500',

        ]);


        $meter  = Power::whereBillercode($request->company)->first();
        $mode = env('MODE');
        $username = env('VTPASSUSERNAME');
        $password = env('VTPASSPASSWORD');
        $str = $username.':'.$password;
        $auth = base64_encode($str);
        $user = Auth::user();
        $total = $request->amount + env('POWERCHARGE');


         if ($total > $user->balance) {
            $notify[] = ['error', 'Insufficient Balance'];
            return back()->withNotify($notify);
        }

        if($mode == 0)
        {
        $url = 'https://sandbox.vtpass.com/api/merchant-verify';
        }
        else
        {
        $url = 'https://vtpass.com/api/merchant-verify';
        }

        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>'{
         "billersCode": "'.$request->number.'",
        "serviceID": "'.$meter->billercode.'",
        "type": "'.$request->type.'"
        }',
      CURLOPT_HTTPHEADER => array(
    'Authorization: Basic '.$auth,
    'Content-Type: application/json',
      ),
    ));

    $resp = curl_exec($curl);
    $reply = json_decode($resp, true);
    curl_close($curl);
    //return  $resp;
 if(!isset($reply['code'] )) 
    {
    $notify[] = ['warning', 'Sorry, We cant proceed with this payment at the moment. Please try again later'];
    return back()->withNotify($notify);
    }
    
    
    
    if(isset($reply['content']['errors'] )) 
    {
    $notify[] = ['warning', 'API '.$reply['content']['errors']];
    return back()->withNotify($notify);
    }
   

    if($reply['code'] != "000") 
    {
    $notify[] = ['warning', 'Sorry, We cant process this payment at the moment'];
    return back()->withNotify($notify);
    }
    
     

    if($reply['code']== 000) {

    if(!isset($reply['content']['Customer_Name']))
     {
    $notify[] = ['error', 'Sorry, We cant validate this Meter number at the moment'];
    return back()->withNotify($notify);
    }

    Session::put('customer', $reply['content']['Customer_Name']);
    Session::put('address', $reply['content']['Address']);
    Session::put('number', $request->number);
    Session::put('type', $request->type);
    Session::put('plancode', $meter->billercode);
    Session::put('meter', $meter->name);
    Session::put('cost', $request->amount);
    return redirect()->route('user.billvalidated');
    }


    }


     public function billvalidated(){

        $settings = GeneralSetting::first();
        $customer = Session::get('customer');
        $number = Session::get('number');
        $address = Session::get('address');
        $plancode = Session::get('plancode');
        $meter = Session::get('meter');
        $cost = Session::get('cost');
        $type = Session::get('type');

        $pageTitle = "Utility Bill Validation";
       return view($this->activeTemplate . 'user.bills.bill-validated', compact('pageTitle','customer','number','plancode','meter','cost','type','address'));
    }




    public function billpay(Request $request)
    {
       $request->validate([
            'number' => 'required',
            'customer' => 'required',

        ]);

         $meter  = Power::whereBillercode($request->company)->first();
        $mode = env('MODE');
        $username = env('VTPASSUSERNAME');
        $password = env('VTPASSPASSWORD');
        $str = $username.':'.$password;
        $auth = base64_encode($str);
        $user = Auth::user();
        $total = $request->amount + env('POWERCHARGE');


        $meter  = Power::whereBillercode($request->plan)->first();
         if ($total > $user->balance) {
            $notify[] = ['error', 'Insufficient Balance'];
            return back()->withNotify($notify);
        }

        if($mode == 0)
        {
        $url = 'https://sandbox.vtpass.com/api/pay';
        }
        else
        {
        $url = 'https://vtpass.com/api/pay';
        }
        $code = getTrx();
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS =>'{
         "billersCode": "'.$request->number.'",
         "variation_code": "'.$request->type.'",
         "phone": "'.$user->mobile.'",
        "serviceID": "'.$meter->billercode.'",
        "amount": "'.$request->amount.'",
        "request_id": "'.$code.'"
        }',
      CURLOPT_HTTPHEADER => array(
    'Authorization: Basic '.$auth,
    'Content-Type: application/json',
      ),
    ));

    $resp = curl_exec($curl);
    $reply = json_decode($resp, true);
    curl_close($curl);
    //return $resp;

    if(!isset($reply['code'] )) 
    {
    $notify[] = ['warning', 'Sorry, We cant proceed with this payment at the moment. Please try again later'];
    return back()->withNotify($notify);
    }
    
    
    
    if(isset($reply['content']['errors'] )) 
    {
    $notify[] = ['warning', 'API '.$reply['content']['errors']];
    return back()->withNotify($notify);
    }
   

    if($reply['code'] != "000") 
    {
    $notify[] = ['warning', 'Sorry, We cant process this payment at the moment'];
    return back()->withNotify($notify);
    }
    
    
     if(!isset($reply['content']['transactions']['transactionId']))
    {
        $notify[] = ['error', 'Sorry, We cant process tbis payment at the moment'];
            return back()->withNotify($notify); 
    }
     
    if($reply['code']== 000) {


      $user->balance -= $total;
      $user->save();


            $transaction = new Bill();
            $transaction->user_id = $user->id;
            $transaction->amount = $request->amount;
            $transaction->trx = $code;
            $transaction->phone = $request->number;
            $transaction->network = $meter->name;
            $transaction->accountnumber = $reply['content']['transactions']['unique_element'];
            $transaction->accountname = $reply['customerName'];
            $transaction->newbalance = $user->balance;
            $transaction->type = 4;
            $transaction->status = 1;
            $transaction->save();

            

            if(isset($reply['mainToken']))
            {
            $transaction->accountnumber = $reply['mainToken'].'<br> Units: '.$reply['mainTokenUnits'];
            }
            else
            {
            $transaction->accountnumber = "Null";
            }
           
            $transaction->accountname = 'Meter: '.$reply['content']['transactions']['product_name'].'<br>Meter Number: '.$reply['content']['transactions']['unique_element'];
            $transaction->newbalance = $user->balance;
    
    
    
            $transactions = new Transaction();
            $transactions->user_id = $user->id;
            $transactions->amount = $request->amount; 
            $transactions->charge = env('POWERCHARGE');
            $transactions->trx_type = '-'; 
            $transactions->details = 'Payment For '.$meter->name.' utility bill with transaction number '.$transaction->trx;
            $transactions->trx = $transaction->trx;
            $transactions->save();
     $notify[] = ['success', 'Payment Was Successfully'];
    return redirect()->route('user.utility')->withNotify($notify);
  }
}



public function utilitytoken($id)
{

  
   $mode = env('MODE');
   $username = env('VTPASSUSERNAME');
   $password = env('VTPASSPASSWORD');
   $str = $username.':'.$password;
   $auth = base64_encode($str);
   $user = auth()->user(); 
   $general = GeneralSetting::first();
   $bill = Bill::whereTrx($id)->whereUserId($user->id)->first();
   if(empty($bill))
   {
       $notify[] = ['error', 'Sorry, Order Not Found'];
       return back()->withNotify($notify);
   }
   
   if($mode == 0)
   {
   $url = 'https://sandbox.vtpass.com/api/requery';
   }
   else
   {
   $url = 'https://vtpass.com/api/requery';
   }
   $curl = curl_init();
   curl_setopt_array($curl, array(
   CURLOPT_URL => $url,
   CURLOPT_RETURNTRANSFER => true,
   CURLOPT_ENCODING => "",
   CURLOPT_MAXREDIRS => 10,
   CURLOPT_TIMEOUT => 0,
   CURLOPT_FOLLOWLOCATION => true,
   CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
   CURLOPT_CUSTOMREQUEST => "POST",
   CURLOPT_POSTFIELDS =>'{
    "request_id": "'.$id.'"
   }',
 CURLOPT_HTTPHEADER => array(
'Authorization: Basic '.$auth,
'Content-Type: application/json',
 ),
));

$resp = curl_exec($curl);
$reply = json_decode($resp, true);
curl_close($curl);
if(!isset($reply['code'])) {
$notify[] = ['error', 'Sorry, We cant process this payment at the moment'];
return back()->withNotify($notify);
}

//return $reply;
if(isset($reply['content']['errors'] )) 
   {
   $notify[] = ['warning', $reply['content']['errors']];
   return back()->withNotify($notify);
   }
   

if($reply['code'] != "000") {
$notify[] = ['error', 'Sorry, We cant process tbis payment at the moment'];
return back()->withNotify($notify);
}


   
    if(!isset($reply['content']['transactions']['product_name']))
   {
       $notify[] = ['error', 'Sorry, We cant process this payment at the moment'];
           return back()->withNotify($notify); 
   }
   //return $resp;
   $token = isset($reply['purchased_code']);
   $customer = isset($reply['customerName']);
   $address = isset($reply['customerAddress']);
   $unit = isset($reply['mainTokenUnits']);
   $status = isset($reply['content']['transactions']['status']);
   $meter = isset($reply['content']['transactions']['unique_element']);
   $disco = isset($reply['content']['transactions']['product_name']);
   $amount = isset($reply['content']['transactions']['unit_price']);
   
   $bill->api = json_encode($reply);
   $bill->save();
   

   $pageTitle = "Utility Token";
   return view($this->activeTemplate . 'user.bills.utility-token', compact('pageTitle','address','token','status','meter','unit','disco','amount','customer'));
}

public function waecreg()
{
  $mode = env('MODE');
   $charge = env('WAECCHARGE');
   
   $user = auth()->user(); 
   $general = GeneralSetting::first();
    $pageTitle = 'WAEC Registration';
    $user = Auth::user(); 
    $bills = Bill::whereUserId($user->id)->whereType(5)->get();

    if($mode == 0)
   {
   $url = 'https://sandbox.vtpass.com/api/service-variations?serviceID=waec-registration';
   }
   else
   {
   $url = 'https://vtpass.com/api/service-variations?serviceID=waec-registration';
   } 
    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => $url,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'GET',
      
    ));

    $response = curl_exec($curl);
    curl_close($curl);
    $reply = json_decode($response, true);
    //return $response;

    if(!isset($reply['response_description'])) {
      $notify[] = ['error', 'Sorry, We cant process this registration at the moment'];
      return back()->withNotify($notify);
      }
      
      //return $reply;
      if(isset($reply['content']['errors'] )) 
         {
         $notify[] = ['warning', $reply['content']['errors']];
         return back()->withNotify($notify);
         }
         
      
      if($reply['response_description'] != "000") {
      $notify[] = ['error', 'Sorry, We cant process tbis operation at the moment'];
      return back()->withNotify($notify);
      } 
    $network = $reply['content']; 
    $forms = $reply['content']['varations']; 
    return view($this->activeTemplate . 'user.bills.waec-register', compact(
        'pageTitle',
        'network',
        'bills',
        'forms',
        'charge',
        'user'
    ));
}

public function waecregpost(Request $request,$id)
{
    $this->validate($request, [
        'phone' => 'required|numeric',
        'variant' => 'required',
        'amount' => 'required'

    ]);
    $user = Auth::user();
    
    $mode = env('MODE');
    $total=$request->amount;
       if ($user->balance < $total)
       {
        $notify[] = ['error', 'You dont have enough balance to start this transcation.'];
        return back()->withNotify($notify);
       }


    $username = env('VTPASSUSERNAME');
    $password = env('VTPASSPASSWORD');
    $str = $username.':'.$password;
    $auth = base64_encode($str);

$trx = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890') , 0 , 10 );
if($mode == 0)
    {
    $url = 'https://sandbox.vtpass.com/api/pay';
    }
    else
    {
    $url = 'https://vtpass.com/api/pay';
    }
    $curl = curl_init();
    curl_setopt_array($curl, array(
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_POSTFIELDS =>'{
    "amount": "'.$request->amount.'",
    "phone": "'.$request->phone.'",
    "serviceID": "'.$id.'",
    "variation_code": "'.$request->variant.'",
    "request_id": "'.$trx.'"
    }',
  CURLOPT_HTTPHEADER => array(
'Authorization: Basic '.$auth,
'Content-Type: application/json',
  ),
));

$resp = curl_exec($curl);
$reply = json_decode($resp, true);
curl_close($curl);
//return $reply;
if(!isset($reply['code'] )) 
{
$notify[] = ['warning', 'Sorry, We cant proceed with this payment at the moment. Please try again later'];
return back()->withNotify($notify);
}



if(isset($reply['content']['errors'] )) 
{
$notify[] = ['warning', 'API '.$reply['content']['errors']];
return back()->withNotify($notify);
}


if($reply['code'] != "000") 
{
$notify[] = ['warning', 'Sorry, We cant process this payment at the moment'];
return back()->withNotify($notify);
}


 if(!isset($reply['content']['transactions']['product_name']))
{
    $notify[] = ['error', 'Sorry, We cant process tbis payment at the moment'];
        return back()->withNotify($notify); 
}

 if($reply['code'] == 000)
 {
      $user->balance -= $total;
      $user->save();

        $transaction = new Bill();
        $transaction->user_id = $user->id;
        $transaction->amount = $request->amount;
        $transaction->trx = $trx;
        $transaction->phone = $request->phone;
        $transaction->accountnumber = $reply['purchased_code'];
        $transaction->accountname = $request->name;
        $transaction->network = $reply['content']['transactions']['product_name'];
        $transaction->newbalance = $user->balance;
        $transaction->type = 5;
        $transaction->status = 1;
        $transaction->save();


    
        $transactions = new Transaction();
        $transactions->user_id = $user->id;
        $transactions->amount = $reply['amount']; 
        $transactions->charge = env('WAECCHARGE');
        $transactions->trx_type = '-'; 
        $transactions->details = 'Payment For '.$reply['content']['transactions']['product_name'].'  with transaction number '.$transaction->trx;
        $transactions->trx = $transaction->trx;
        $transactions->save();
        
      $notify[] = ['success', 'WAEC Registration Token Purchase Was Successful'];
        return back()->withNotify($notify);

 }
 $notify[] = ['error', 'WAEC Registration Token Purchase Was Not Successful'];
 return back()->withNotify($notify);
 }


public function waecresult()
{
  $mode = env('MODE');
   $charge = env('WAECRESULT');
   
   $user = auth()->user(); 
   $general = GeneralSetting::first();
    $pageTitle = 'WAEC Result Checker';
    $user = Auth::user(); 
    $bills = Bill::whereUserId($user->id)->whereType(6)->get();

    if($mode == 0)
   {
   $url = 'https://sandbox.vtpass.com/api/service-variations?serviceID=waec';
   }
   else
   {
   $url = 'https://vtpass.com/api/service-variations?serviceID=waec';
   } 
    $curl = curl_init();

    curl_setopt_array($curl, array(
      CURLOPT_URL => $url,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => 'GET',
      
    ));

    $response = curl_exec($curl);
    curl_close($curl);
    $reply = json_decode($response, true);
    //return $response;

    if(!isset($reply['response_description'])) {
      $notify[] = ['error', 'Sorry, We cant process this registration at the moment'];
      return back()->withNotify($notify);
      }
      
      //return $reply;
      if(isset($reply['content']['errors'] )) 
         {
         $notify[] = ['warning', $reply['content']['errors']];
         return back()->withNotify($notify);
         }
         
      
      if($reply['response_description'] != "000") {
      $notify[] = ['error', 'Sorry, We cant process tbis operation at the moment'];
      return back()->withNotify($notify);
      } 
    $network = $reply['content']; 
    $forms = $reply['content']['varations']; 
    return view($this->activeTemplate . 'user.bills.waec-result', compact(
        'pageTitle',
        'network',
        'bills',
        'forms',
        'charge',
        'user'
    ));
}
 


public function resultwaecpost(Request $request,$id)
{
    $this->validate($request, [
        'phone' => 'required|numeric',
        'variant' => 'required',
        'amount' => 'required'

    ]);
    $user = Auth::user();
    
    $mode = env('MODE');
    $total=$request->amount;
       if ($user->balance < $total)
       {
        $notify[] = ['error', 'You dont have enough balance to start this transcation.'];
        return back()->withNotify($notify);
       }


    $username = env('VTPASSUSERNAME');
    $password = env('VTPASSPASSWORD');
    $str = $username.':'.$password;
    $auth = base64_encode($str);

$trx = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890') , 0 , 10 );
if($mode == 0)
    {
    $url = 'https://sandbox.vtpass.com/api/pay';
    }
    else
    {
    $url = 'https://vtpass.com/api/pay';
    }
    $curl = curl_init();
    curl_setopt_array($curl, array(
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_POSTFIELDS =>'{
    "amount": "'.$request->amount.'",
    "phone": "'.$request->phone.'",
    "serviceID": "'.$id.'",
    "variation_code": "'.$request->variant.'",
    "request_id": "'.$trx.'"
    }',
  CURLOPT_HTTPHEADER => array(
'Authorization: Basic '.$auth,
'Content-Type: application/json',
  ),
));

$resp = curl_exec($curl);
$reply = json_decode($resp, true);
curl_close($curl);
//return $reply;
if(!isset($reply['code'] )) 
{
$notify[] = ['warning', 'Sorry, We cant proceed with this payment at the moment. Please try again later'];
return back()->withNotify($notify);
}



if(isset($reply['content']['errors'] )) 
{
$notify[] = ['warning', 'API '.$reply['content']['errors']];
return back()->withNotify($notify);
}


if($reply['code'] != "000") 
{
$notify[] = ['warning', 'Sorry, We cant process this payment at the moment'];
return back()->withNotify($notify);
}


 if(!isset($reply['content']['transactions']['product_name']))
{
    $notify[] = ['error', 'Sorry, We cant process tbis payment at the moment'];
        return back()->withNotify($notify); 
}

 if($reply['code'] == 000)
 {
      $user->balance -= $total;
      $user->save();

        $transaction = new Bill();
        $transaction->user_id = $user->id;
        $transaction->amount = $request->amount;
        $transaction->trx = $trx;
        $transaction->phone = $request->phone;
        $transaction->accountnumber = $reply['purchased_code'];
        $transaction->accountname = $request->name;
        $transaction->network = $reply['content']['transactions']['product_name'];
        $transaction->newbalance = $user->balance;
        $transaction->type = 6;
        $transaction->status = 1;
        $transaction->save();


    
        $transactions = new Transaction();
        $transactions->user_id = $user->id;
        $transactions->amount = $reply['amount']; 
        $transactions->charge = env('WAECRESULT');
        $transactions->trx_type = '-'; 
        $transactions->details = 'Payment For '.$reply['content']['transactions']['product_name'].'  with transaction number '.$transaction->trx;
        $transactions->trx = $transaction->trx;
        $transactions->save();
        
      $notify[] = ['success', 'WAEC Registration Token Purchase Was Successful'];
        return back()->withNotify($notify);

 }
 $notify[] = ['error', 'WAEC Registration Token Purchase Was Not Successful'];
 return back()->withNotify($notify);
 }


}
