<?php

namespace App\Http\Controllers;

use App\Lib\GoogleAuthenticator;
use App\Models\AdminNotification;
use App\Models\Bill;
use App\Models\Desk;
use App\Models\GeneralSetting;
use App\Models\Transaction;
use App\Models\WithdrawMethod;
use App\Models\Withdrawal;
use App\Models\Transfer;
use App\Models\TransferBeneficiary;
use App\Models\Deposit;
use App\Models\Plan;
use App\Models\PlanTimer;
use App\Models\Kyc;
use App\Models\Kycsetting;
use App\Models\Loan;
use App\Models\Savings;
use App\Models\SupportTicket;
use App\Models\SupportMessage;
use App\Models\SupportAttachment;
use App\Models\SavingPay;
use App\Models\User;
use App\Models\Userlogin;
use App\Models\Investment;
use App\Models\GatewayCurrency;
use App\Rules\FileTypeValidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Carbon\Carbon;

class UserController extends Controller
{
    public function __construct()
    {
        $this->activeTemplate = activeTemplate();
    }

    public function home()
    {
        $pageTitle = 'Dashboard';
        $year = date('Y');
        $month = date('m');
        $day = date('d');

        $jan = '01';
        $feb = '02';
        $mar = '03';
        $apr = '04';
        $may = '05';
        $jun = '06';
        $jul = '07';
        $aug = '08';
        $sep = '09';
        $oct = '10';
        $nov = '11';
        $dec = '12';

        $user = Auth::user();

        $data['tjan'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $jan)->sum('amount');
        $data['tfeb'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $feb)->sum('amount');
        $data['tmar'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $mar)->sum('amount');
        $data['tapr'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $apr)->sum('amount');
        $data['tmay'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $may)->sum('amount');
        $data['tjun'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $jun)->sum('amount');
        $data['tjul'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $jul)->sum('amount');
        $data['taug'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $aug)->sum('amount');
        $data['tsep'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $sep)->sum('amount');
        $data['toct'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $oct)->sum('amount');
        $data['tnov'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $nov)->sum('amount');
        $data['tdec'] = Deposit::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $dec)->sum('amount');


        $data['rjan'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $jan)->sum('amount');
        $data['rfeb'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $feb)->sum('amount');
        $data['rmar'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $mar)->sum('amount');
        $data['rapr'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $apr)->sum('amount');
        $data['rmay'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $may)->sum('amount');
        $data['rjun'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $jun)->sum('amount');
        $data['rjul'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $jul)->sum('amount');
        $data['raug'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $aug)->sum('amount');
        $data['rsep'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $sep)->sum('amount');
        $data['roct'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $oct)->sum('amount');
        $data['rnov'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $nov)->sum('amount');
        $data['rdec'] = Withdrawal::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->whereMonth('created_at', $dec)->sum('amount');

        $logins = Userlogin::where('user_id', $user->id)->get();
        $bills = Bill::where('user_id', $user->id)->take(6)->latest()->get();

        $totalDeposit = Transaction::where('user_id', $user->id)->where('trx_type', '+')->sum('amount');
        $totalWithdraw = Transaction::where('user_id', $user->id)->where('trx_type', '-')->sum('amount');

        $PDeposit = Deposit::where('user_id', $user->id)->where('status', 2)->sum('amount');
        $PWithdraw = Withdrawal::where('user_id', $user->id)->where('status', 2)->sum('amount');
        $latestTrx = Transaction::where('user_id', $user->id)->latest()->limit(10)->get();
        $totalInvest = Investment::where('user_id', $user->id)->whereUsd(0)->sum('amount');
        $totalInvestusd = Investment::where('user_id', $user->id)->whereUsd(1)->sum('amount');
        $plans = Plan::where('status', 1)->get();
        $emptyMessage = 'No Transaction Record Found At The Moment. Please Check Back Later';
        $yloan = Loan::where('user_id', $user->id)->whereStatus(1)->whereYear('created_at', $year)->where('status', '!=', 0)->where('status', '!=', 3)->sum('amount');
        $loan = Loan::where('user_id', $user->id)->whereStatus(1)->whereStatus(1)->sum('amount');
        $paid = Loan::where('user_id', $user->id)->whereStatus(1)->whereStatus(1)->sum('paid');
        $bal = $loan-$paid;
        $saved = Savings::where('user_id', $user->id)->whereYear('created_at', $year)->sum('balance');


        return view($this->activeTemplate . 'user.dashboard',$data, compact(
            'pageTitle',
            'PDeposit',
            'PWithdraw',
            'bills',
            'user',
            'logins',
            'totalDeposit',
            'totalWithdraw',
            'latestTrx',
            'emptyMessage',
            'totalInvest',
            'totalInvestusd',
            'loan',
            'yloan',
            'saved',
            'bal',
            'plans'
        ));
    }


      public function ref()
    {
        $pageTitle = "Referral System";
        $user = Auth::user();
        $ref = User::whereRefBy(Auth::user()->id)->get();
        $trans = Transaction::whereUserId(Auth::user()->id)->whereRef(1)->get();
        return view($this->activeTemplate. 'user.settings.referral', compact('pageTitle','user','ref','trans'));
    }


    public function profile()
    {
        $pageTitle = "Profile Setting";
        $user = Auth::user();
        return view($this->activeTemplate. 'user.settings.profile_setting', compact('pageTitle','user'));
    }

    public function submitProfile(Request $request)
    {
        $request->validate([
            'firstname' => 'required|string|max:50',
            'lastname' => 'required|string|max:50',
            'address' => 'sometimes|required|max:80',
            'state' => 'sometimes|required|max:80',
            'zip' => 'sometimes|required|max:40',
            'city' => 'sometimes|required|max:50',
            'image' => ['image',new FileTypeValidate(['jpg','jpeg','png'])]
        ],[
            'firstname.required'=>'First name field is required',
            'lastname.required'=>'Last name field is required'
        ]);

        $user = Auth::user();

        $in['firstname'] = $request->firstname;
        $in['lastname'] = $request->lastname;

        $in['address'] = [
            'address' => $request->address,
            'state' => $request->state,
            'zip' => $request->zip,
            'country' => @$user->address->country,
            'city' => $request->city,
        ];


        if ($request->hasFile('image')) {
            $location = imagePath()['profile']['user']['path'];
            $size = imagePath()['profile']['user']['size'];
            $filename = uploadImage($request->image, $location, $size, $user->image);
            $in['image'] = $filename;
        }
        $user->fill($in)->save();
        $notify[] = ['success', 'Profile updated successfully.'];
        return back()->withNotify($notify);
    }

    public function changePassword()
    {
        $pageTitle = 'Change password';
        return view($this->activeTemplate . 'user.settings.password', compact('pageTitle'));
    }

    public function submitPassword(Request $request)
    {

        $password_validation = Password::min(6);
        $general = GeneralSetting::first();

        $this->validate($request, [
            'current_password' => 'required',
            'password' => ['required','confirmed',$password_validation]
        ]);


        try {
            $user = auth()->user();
            if (Hash::check($request->current_password, $user->password)) {
                $password = Hash::make($request->password);
                $user->password = $password;
                $user->save();
                $notify[] = ['success', 'Password changes successfully.'];
                return back()->withNotify($notify);
            } else {
                $notify[] = ['error', 'The password doesn\'t match!'];
                return back()->withNotify($notify);
            }
        } catch (\PDOException $e) {
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify);
        }
    }

    /*
     * Deposit History
     */
    public function depositHistory()
    {
        $pageTitle = 'Deposit History';
        $emptyMessage = 'No history found.';
        $logs = auth()->user()->deposits()->with(['gateway'])->orderBy('id','desc')->paginate(getPaginate());
        return view($this->activeTemplate.'user.deposit.deposit_history', compact('pageTitle', 'emptyMessage', 'logs'));
    }

    /*
     * Withdraw Operation
     */


       public function othertransfer()
    {
        $pageTitle = 'Other Bank Transfer';

        $user = auth()->user();
        $benefit = TransferBeneficiary::whereMethod_id(2)->whereUserId($user->id)->get();
        $log = Transfer::whereMethod_id(2)->whereUserId($user->id)->latest()->paginate(10);

        $curl = curl_init();

  curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://api.paystack.co/bank',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Bearer SECRET_KEY'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
$reply = json_decode($response, true);

 if (!isset($reply)) {
            $notify[] = ['error', 'Invalid Bank API Response. Check Internet Settings' ];
            return back()->withNotify($notify);
        }
        if (!$reply['data']) {
            $notify[] = ['error', 'Banks Not Available At The Moment. '];
            return back()->withNotify($notify);
        }

       $banks = $reply['data'];


        return view($this->activeTemplate.'user.transfer.othertransfer', compact('pageTitle','banks','log'));
    }

        public function othertransfersubmit(Request $request)
    {
        $this->validate($request, [
            'type' => 'required',
            'amount' => 'required|numeric'
        ]);
        $user = auth()->user();


        if ($request->amount > $user->balance) {
            $notify[] = ['error', 'You do not have sufficient balance for transfer.'];
            return back()->withNotify($notify);
        }

        if($request->type == 1)
        {
        $this->validate($request, [
            'bank' => 'required',
            'account' => 'required',
        ]);

        $key = GatewayCurrency::whereMethodCode(107)->first()->gateway_parameter;
        $parameter = json_decode($key, true);
        $secret = $parameter['secret_key'];

  $curl = curl_init();

  curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://api.paystack.co/bank/resolve?account_number='.$request->account.'&bank_code='.$request->bank.'',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Bearer '.$secret
  ),
));

$response = curl_exec($curl);

curl_close($curl);
$reply = json_decode($response, true);
if(!isset($reply))
{
 $notify[] = ['error', 'Invalid Gateway Response.'];
 return back()->withNotify($notify);
}
if($reply['status'] != 'true')
{
 $notify[] = ['error', 'Invalid Gateway Response.'];
 return back()->withNotify($notify);
}

if($reply['status'] == 'true')
{

session()->put('name', $reply['data']['account_name']);
session()->put('amount', $request->amount);
session()->put('accountnumber', $request->account);
session()->put('bankcode', $request->bank);
session()->put('bankname', $request->bankn);
session()->put('type', $request->type);
return redirect()->route('user.transfer.previewother');
}

}
       if($request->type == 2)
        {
        $this->validate($request, [
            'bankname' => 'required',
            'accountnumber' => 'required',
            'accountname' => 'required',
            'country' => 'required',
            'swiftcode' => 'required',
            ]);

session()->put('name', $request->accountname);
session()->put('amount', $request->amount);
session()->put('accountnumber', $request->accountnumber);
session()->put('bankcode', $request->swiftcode);
session()->put('bankname', $request->bankname);

session()->put('country', $request->country);
session()->put('type', $request->type);
 return redirect()->route('user.transfer.previewother');
        }

 $notify[] = ['error', 'Sorry we cant process this transfer at the moment.'];
 return back()->withNotify($notify);

    }


      public function transferpreviewother()
    {
        $amount = session()->get('amount');
        $accountnumber = session()->get('accountnumber');
        $name = session()->get('name');
        $bankcode = session()->get('bankcode');
        $country = session()->get('country');
        $bankname = session()->get('bankname');
        $type = session()->get('type');
        $pageTitle = 'Transfer Preview';
        return view($this->activeTemplate . 'user.transfer.previewother', compact('type','pageTitle','amount','accountnumber','name','bankcode','country','bankname'));
    }


        public function transferpreviewothersubmit(Request $request)
    {

        $general = GeneralSetting::first();
        $amount = session()->get('amount');
        $accountnumber = session()->get('accountnumber');
        $name = session()->get('name');
        $bankcode = session()->get('bankcode');
        $country = session()->get('country');
        $bankname = session()->get('bankname');
        $type = session()->get('type');
        $chargepay = $request->chargepay;

        $charge = $amount * $general->transferfee/100;

        $user = auth()->user();

        $total = $amount + $charge;

        if ($amount > $user->balance) {
            $notify[] = ['error', 'You do not have sufficient balance for transfer.'];
            return back()->withNotify($notify);
        }

        if($chargepay == 2)
        {
         if ($total > $user->balance) {
            $notify[] = ['error', 'You do not have sufficient balance for transfer.'];
            return back()->withNotify($notify);
         }
         $pay = $total;
        }
         $pay = $amount;

        if($type == 1)

        {
 $key = GatewayCurrency::whereMethodCode(109)->first()->gateway_parameter;
        $parameter = json_decode($key, true);
        $secret = $parameter['secret_key'];
$url = "https://api.flutterwave.com/v3/transfers";
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => $url,
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
	"account_bank": "'.$bankcode.'",
    "account_number": "'.$accountnumber.'",
    "amount": "'.$pay.'",
    "narration": "Fund Transfer",
    "currency": "NGN",
    "reference": "'.getTrx().'",
    "callback_url": "https://webhook.site/b3e505b0-fe02-430e-a538-22bbbce8ce0d",
    "debit_currency": "NGN"
}',
  CURLOPT_HTTPHEADER => array(
  'Content-Type: application/json',
  'Authorization: Bearer '.$secret
  ),
));

$response = curl_exec($curl);


if(!isset($response))
{
$notify[] = ['error', 'Invalid API Response.'];
return back()->withNotify($notify);
}

curl_close($curl);
$rep=json_decode($response, true);

if(!isset($rep))
{
$notify[] = ['error', 'Invalid API Response.'];
return back()->withNotify($notify);
}
if($rep['status'] != 'success')
{
$notify[] = ['error', 'Invalid API Response.'];
return back()->withNotify($notify);
}

if($rep['status'] == 'success')
{

        $transfer = new Transfer();
        $transfer->method_id = 2; // wallet method ID
        $transfer->user_id = $user->id;
        $transfer->charge = $charge;
        $transfer->amount = $amount;
        $transfer->details =
        "Bank Name: ".$rep['data']['bank_name']."<br>
        Account Name: ".$rep['data']['full_name']."<br>
        Account Number:  ".$rep['data']['account_number']."<br>
        Narration: ".$rep['data']['narration']."";
        $transfer->status = 1;
        $transfer->trx = $rep['data']['reference'];
        $transfer->save();

         if($chargepay == 2)
        {
         $user->balance -= $total;
        }

         {
          $user->balance -= $amount;
         }
         $user->save();


            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->amount = $amount;
            $transaction->post_balance = $user->balance;
            $transaction->charge = $charge;
            $transaction->trx_type = '-';
            $transaction->details = 'Transfer Fund To' . $rep['data']['bank_name']. ' '.$rep['data']['account_number'];
            $transaction->trx = $rep['data']['reference'];
            $transaction->save();

        $request->session()->forget('amount');
        $request->session()->forget('accountnumber');
        $request->session()->forget('name');
        $request->session()->forget('bankcode');
        $request->session()->forget('country');
        $request->session()->forget('bankname');
        $request->session()->forget('type');


        $notify[] = ['success', 'Fund Transfered Successfully'];
        return redirect()->route('user.othertransfer')->withNotify($notify);

}


        }


        else
        {
        $trx = getTrx();
        $transfer = new Transfer();
        $transfer->method_id = 2; // wallet method ID
        $transfer->user_id = $user->id;
        $transfer->charge = $charge;
        $transfer->amount = $amount;
        $transfer->details =
        "Bank Name: ".$bankname."<br>
        Account Name: ".$name."<br>
        Account Number:  ".$accountnumber."<br>
        Swift Code:  ".$bankcode."<br>
        Narration: Other Bank Transfer";
        $transfer->status = 0;
        $transfer->trx = $trx;
        $transfer->save();

         if($chargepay == 2)
        {
         $user->balance -= $total;
        }

         {
          $user->balance -= $amount;
         }
         $user->save();


            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->amount = $amount;
            $transaction->post_balance = $user->balance;
            $transaction->charge = $charge;
            $transaction->trx_type = '-';
            $transaction->details = 'Transfer Fund To' . $bankname. ' '.$accountnumber;
            $transaction->trx = $trx;
            $transaction->save();

        $request->session()->forget('amount');
        $request->session()->forget('accountnumber');
        $request->session()->forget('name');
        $request->session()->forget('bankcode');
        $request->session()->forget('country');
        $request->session()->forget('bankname');
        $request->session()->forget('type');


        $notify[] = ['success', 'Fund Transfered Successfully'];
        return redirect()->route('user.othertransfer')->withNotify($notify);
        }

    }


    public function usertransfer()
    {
        $pageTitle = 'User To User Transfer';

        $user = auth()->user();
        $benefit = TransferBeneficiary::whereMethod_id(1)->whereUserId($user->id)->get();
        $log = Transfer::whereMethod_id(1)->whereUserId($user->id)->latest()->paginate(10);

        return view($this->activeTemplate.'user.transfer.usertransfer', compact('pageTitle','benefit','log'));
    }


       public function requestsubmit(Request $request)
    {
        $this->validate($request, [
            'type' => 'required',
            'amount' => 'required|numeric'
        ]);
        $user = auth()->user();

        if($request->type == 1)
        {
        $this->validate($request, [
            'beneficiary' => 'required',
        ]);
        $username = $request->beneficiary;
        }
        else
        {
        $this->validate($request, [
            'username' => 'required',
        ]);
        $username = $request->username;
        }
        $beneficiary = User::whereAccountNumber($username)->first();

        if ($username == $user->account_number) {
            $notify[] = ['error', 'You cant transfer fund to the same beneficiary account.'];
            return back()->withNotify($notify);
        }

        if (!$beneficiary) {
            $notify[] = ['error', 'Invalid Beneficiary Account Number.'];
            return back()->withNotify($notify);
        }
        if ($request->amount > $user->balance) {
            $notify[] = ['error', 'You do not have sufficient balance for this transfer.'];
            return back()->withNotify($notify);
        }


        $withdraw = new Transfer();
        $withdraw->method_id = 1; // wallet method ID
        $withdraw->user_id = $user->id;
        $withdraw->amount = $request->amount;
        $withdraw->details = $username;
        $withdraw->status = 1;
        $withdraw->trx = getTrx();
        //$withdraw->save();
        session()->put('username', $withdraw->details);
        session()->put('amount', $withdraw->amount);
        session()->put('fname', $beneficiary->firstname);
        session()->put('lname', $beneficiary->lastname);
        return redirect()->route('user.usertransfer.preview');
    }

      public function usertransferpreview()
    {
        $amount = session()->get('amount');
        $username = session()->get('username');
        $fname = session()->get('fname');
        $lname = session()->get('lname');
        $name = $fname.' '.$lname;
        $pageTitle = 'Transfer Preview';
        return view($this->activeTemplate . 'user.transfer.preview', compact('pageTitle','amount','username','name'));
    }

        public function usertransfersend(Request $request)
    {

        $amount = session()->get('amount');
        $username = session()->get('username');
        $fname = session()->get('fname');
        $lname = session()->get('lname');
        $name = $fname.' '.$lname;

        $user = auth()->user();
        $beneficiary = User::whereAccountNumber($username)->first();

         if ($amount > $user->balance) {
            $notify[] = ['error', 'You do not have sufficient balance for this transfer.'];
            return back()->withNotify($notify);
        }

        if (!$beneficiary) {
            $notify[] = ['error', 'Invalid Beneficiary Detected.'];
            return back()->withNotify($notify);
        }


        $transfer = new Transfer();
        $transfer->method_id = 1; // wallet method ID
        $transfer->user_id = $user->id;
        $transfer->amount = $amount;
        $transfer->details = $username;
        $transfer->status = 1;
        $transfer->trx = getTrx();
        $transfer->save();


         $user->balance -= $amount;
         $user->save();

         $beneficiary->balance += $amount;
         $beneficiary->save();

            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->amount = $amount;
            $transaction->post_balance = $user->balance;
            $transaction->charge = 0;
            $transaction->trx_type = '-';
            $transaction->details = 'Transfer Fund to ' . $username;
            $transaction->trx = $transfer->trx;
            $transaction->save();

            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->amount = $amount;
            $transaction->post_balance = $beneficiary->balance;
            $transaction->charge = 0;
            $transaction->trx_type = '+';
            $transaction->details = 'Fund Receieved From ' . $user->account_number;
            $transaction->trx = $transfer->trx;
            $transaction->save();

            if(isset($request->beneficiary))
                {
            $benefisaved = TransferBeneficiary::whereMethod_id(1)->whereUserId($user->id)->whereDetails($beneficiary->username)->first();
            if(!$benefisaved)
            {
            $benefit = new TransferBeneficiary();
            $benefit->user_id = $user->id;
            $benefit->method_id = 1;
            $benefit->status = 1;
            $benefit->details =  $beneficiary->firstname.' '.$beneficiary->lastname. ' ('.$beneficiary->username.')';
            $benefit->save();
            }
               }


        $request->session()->forget('amount');
        $request->session()->forget('username');
        $request->session()->forget('fname');
        $request->session()->forget('lname');

        $notify[] = ['success', 'Fund Transfered Successfully'];
        return redirect()->route('user.usertransfer')->withNotify($notify);
    }

     public function deletebeneficiary($id)
    {
        $user = auth()->user();
        $benefit = TransferBeneficiary::whereId($id)->whereUserId($user->id)->first();

        if (!$benefit) {
            $notify[] = ['error', 'Beneficiary Not Found'];
            return back()->withNotify($notify);
        }
        else
        {
         $benefit->delete();
         $notify[] = ['success', 'Beneficiary Deleted Successfuly'];
         return back()->withNotify($notify);
        }
    }



    public function withdrawCompound()
    {
        $withdrawMethod = WithdrawMethod::where('status',1)->get();
        $pageTitle = 'Withdraw Others';
        return view($this->activeTemplate.'user.withdraw.others', compact('pageTitle','withdrawMethod'));
    }

    public function withdrawMoney()
    {
        $withdrawMethod = WithdrawMethod::where('status',1)->get();
        $pageTitle = 'Withdraw Fund';
        return view($this->activeTemplate.'user.withdraw.methods', compact('pageTitle','withdrawMethod'));
    }

    public function withdrawCompoundStore(Request $request)
    {
        $this->validate($request, [
            'amount' => 'required|numeric',
            'wallet' => 'required|numeric',
        ]);
        $user = auth()->user();
        $general = GeneralSetting::first();

        if($request->wallet == 1)
        {
        $balance = $user->compound;

         if ($request->amount < $general->min_compound)
            {
            $notify[] = ['error', 'Your requested amount is smaller than minimum amount allowed for compounding interest.'];
            return back()->withNotify($notify);
             }

        }
        if($request->wallet == 2)
        {
        $balance = $user->invest_return;
        }
        if($request->wallet == 3)
        {
        $balance = $user->ref_bonus;
        }

        if ($request->amount > $balance) {
            $notify[] = ['error', 'Insufficient wallet balance.'];
            return back()->withNotify($notify);
        }

        $adminNotification = new AdminNotification();
        $transaction = new Transaction();

        if($request->wallet == 1)
        {
        $user->balance += $request->amount;
        $user->compound -= $request->amount;
        $adminNotification->title = 'New withdraw from compunding interest wallet by '.$user->username;
        $transaction->details = showAmount($request->amount) . ' ' . $general->cur_text . ' Withdraw From Compounding Wallet ';

        }
        if($request->wallet == 2)
        {
        $user->balance += $request->amount;
        $user->invest_return -= $request->amount;
        $adminNotification->title = 'New withdraw from investment return wallet by '.$user->username;
        $transaction->details = showAmount($request->amount) . ' ' . $general->cur_text . ' Withdraw From Investment rRturn Wallet ';

        }
        if($request->wallet == 3)
        {
        $user->balance += $request->amount;
        $user->ref_bonus -= $request->amount;
        $adminNotification->title = 'New withdraw from referral bonus wallet by '.$user->username;
        $transaction->details = showAmount($request->amount) . ' ' . $general->cur_text . ' Withdraw From Referral Bonus Wallet ';

        }

        $user->save();


        $transaction->user_id = $user->id;
        $transaction->amount = $request->amount;
        $transaction->post_balance = $user->balance;
        $transaction->charge = 0;
        $transaction->trx_type = '-';
        $transaction->trx =  getTrx();
        $transaction->save();


        $adminNotification->user_id = $user->id;
        $adminNotification->click_url = '#';
        $adminNotification->save();


        $notify[] = ['success', 'Fund Withdrawal To Central Wallet Successful'];
        return back()->withNotify($notify);

    }

    public function withdrawStore(Request $request)
    {
        $this->validate($request, [
            'method_code' => 'required',
            'amount' => 'required|numeric'
        ]);
        $method = WithdrawMethod::where('id', $request->method_code)->where('status', 1)->firstOrFail();
        $user = auth()->user();
        if ($request->amount < $method->min_limit) {
            $notify[] = ['error', 'Your requested amount is smaller than minimum amount.'];
            return back()->withNotify($notify);
        }
        if ($request->amount > $method->max_limit) {
            $notify[] = ['error', 'Your requested amount is larger than maximum amount.'];
            return back()->withNotify($notify);
        }

        if ($request->amount > $user->balance) {
            $notify[] = ['error', 'You do not have sufficient balance for withdraw.'];
            return back()->withNotify($notify);
        }


        $charge = $method->fixed_charge + ($request->amount * $method->percent_charge / 100);
        $afterCharge = $request->amount - $charge;
        $finalAmount = $afterCharge * $method->rate;

        $withdraw = new Withdrawal();
        $withdraw->method_id = $method->id; // wallet method ID
        $withdraw->user_id = $user->id;
        $withdraw->amount = $request->amount;
        $withdraw->currency = $method->currency;
        $withdraw->rate = $method->rate;
        $withdraw->charge = $charge;
        $withdraw->final_amount = $finalAmount;
        $withdraw->after_charge = $afterCharge;
        $withdraw->trx = getTrx();
        $withdraw->save();
        session()->put('wtrx', $withdraw->trx);
        return redirect()->route('user.withdraw.preview');
    }

    public function withdrawPreview()
    {
        $withdraw = Withdrawal::with('method','user')->where('trx', session()->get('wtrx'))->where('status', 0)->orderBy('id','desc')->firstOrFail();
        $pageTitle = 'Wire Transfer Preview';
        return view($this->activeTemplate . 'user.withdraw.preview', compact('pageTitle','withdraw'));
    }


    public function withdrawSubmit(Request $request)
    {
        $general = GeneralSetting::first();
        $withdraw = Withdrawal::with('method','user')->where('trx', session()->get('wtrx'))->where('status', 0)->orderBy('id','desc')->firstOrFail();

        $rules = [];
        $inputField = [];
        if ($withdraw->method->user_data != null) {
            foreach ($withdraw->method->user_data as $key => $cus) {
                $rules[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rules[$key], 'image');
                    array_push($rules[$key], new FileTypeValidate(['jpg','jpeg','png']));
                    array_push($rules[$key], 'max:2048');
                }
                if ($cus->type == 'text') {
                    array_push($rules[$key], 'max:191');
                }
                if ($cus->type == 'textarea') {
                    array_push($rules[$key], 'max:300');
                }
                $inputField[] = $key;
            }
        }

        $this->validate($request, $rules);

        $user = auth()->user();

        if($withdraw->amount > $user->balance) {
            $notify[] = ['error', 'Your request amount is larger then your current balance.'];
            return back()->withNotify($notify);
        }

        $directory = date("Y")."/".date("m")."/".date("d");
        $path = imagePath()['verify']['withdraw']['path'].'/'.$directory;
        $collection = collect($request);
        $reqField = [];
        if ($withdraw->method->user_data != null) {
            foreach ($collection as $k => $v) {
                foreach ($withdraw->method->user_data as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {
                        if ($inVal->type == 'file') {
                            if ($request->hasFile($inKey)) {
                                try {
                                    $reqField[$inKey] = [
                                        'field_name' => $directory.'/'.uploadImage($request[$inKey], $path),
                                        'type' => $inVal->type,
                                    ];
                                } catch (\Exception $exp) {
                                    $notify[] = ['error', 'Could not upload your ' . $request[$inKey]];
                                    return back()->withNotify($notify)->withInput();
                                }
                            }
                        } else {
                            $reqField[$inKey] = $v;
                            $reqField[$inKey] = [
                                'field_name' => $v,
                                'type' => $inVal->type,
                            ];
                        }
                    }
                }
            }
            $withdraw['withdraw_information'] = $reqField;
        } else {
            $withdraw['withdraw_information'] = null;
        }


        $withdraw->status = 2;
        $withdraw->save();
        $user->balance  -=  $withdraw->amount;
        $user->save();



        $transaction = new Transaction();
        $transaction->user_id = $withdraw->user_id;
        $transaction->amount = $withdraw->amount;
        $transaction->post_balance = $user->balance;
        $transaction->charge = $withdraw->charge;
        $transaction->trx_type = '-';
        $transaction->details = showAmount($withdraw->final_amount) . ' ' . $withdraw->currency . ' Withdraw Via ' . $withdraw->method->name;
        $transaction->trx =  $withdraw->trx;
        $transaction->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = $user->id;
        $adminNotification->title = 'New withdraw request from '.$user->username;
        $adminNotification->click_url = urlPath('admin.withdraw.details',$withdraw->id);
        $adminNotification->save();

        notify($user, 'WITHDRAW_REQUEST', [
            'method_name' => $withdraw->method->name,
            'method_currency' => $withdraw->currency,
            'method_amount' => showAmount($withdraw->final_amount),
            'amount' => showAmount($withdraw->amount),
            'charge' => showAmount($withdraw->charge),
            'currency' => $general->cur_text,
            'rate' => showAmount($withdraw->rate),
            'trx' => $withdraw->trx,
            'post_balance' => showAmount($user->balance),
            'delay' => $withdraw->method->delay
        ]);

        $notify[] = ['success', 'Withdraw request sent successfully'];
        return redirect()->route('user.withdraw.history')->withNotify($notify);
    }

    public function withdrawLog()
    {
        $pageTitle = "Wire Transfer Log";
        $withdraws = Withdrawal::where('user_id', Auth::id())->where('status', '!=', 0)->with('method')->orderBy('id','desc')->paginate(getPaginate());
        $emptyMessage = "No Data Found!";
        return view($this->activeTemplate.'user.withdraw.log', compact('pageTitle','withdraws', 'emptyMessage'));
    }



    public function show2faForm()
    {
        $general = GeneralSetting::first();
        $ga = new GoogleAuthenticator();
        $user = auth()->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . $general->sitename, $secret);
        $pageTitle = 'Two Factor';
        return view($this->activeTemplate.'user.settings.twofactor', compact('pageTitle', 'secret', 'qrCodeUrl'));
    }

    public function create2fa(Request $request)
    {
        $user = auth()->user();
        $this->validate($request, [
            'key' => 'required',
            'code' => 'required',
        ]);
        $response = verifyG2fa($user,$request->code,$request->key);
        if ($response) {
            $user->tsc = $request->key;
            $user->ts = 1;
            $user->save();
            $userAgent = getIpInfo();
            $osBrowser = osBrowser();
            notify($user, '2FA_ENABLE', [
                'operating_system' => @$osBrowser['os_platform'],
                'browser' => @$osBrowser['browser'],
                'ip' => @$userAgent['ip'],
                'time' => @$userAgent['time']
            ]);
            $notify[] = ['success', 'Google authenticator enabled successfully'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'Wrong verification code'];
            return back()->withNotify($notify);
        }
    }


    public function disable2fa(Request $request)
    {
        $this->validate($request, [
            'code' => 'required',
        ]);

        $user = auth()->user();
        $response = verifyG2fa($user,$request->code);
        if ($response) {
            $user->tsc = null;
            $user->ts = 0;
            $user->save();
            $userAgent = getIpInfo();
            $osBrowser = osBrowser();
            notify($user, '2FA_DISABLE', [
                'operating_system' => @$osBrowser['os_platform'],
                'browser' => @$osBrowser['browser'],
                'ip' => @$userAgent['ip'],
                'time' => @$userAgent['time']
            ]);
            $notify[] = ['success', 'Two factor authenticator disable successfully'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }

    public function trxLog(Request $request)
    {
        $pageTitle = 'Transaction Log';
        $user = Auth::user();
        if(!empty($request->from))
        {
         $logs = Transaction::where('user_id', $user->id)->whereBetween('created_at',[$request->from,$request->to])->latest()->get();
        }
        else
        {
         $logs = Transaction::where('user_id', $user->id)->latest()->get();
        }

        $emptyMessage = 'Data Not Found';
        return view($this->activeTemplate.'user.trx_log', compact('pageTitle', 'user', 'logs', 'emptyMessage'));
    }


    public function investmentnew(){
        $pageTitle = 'New Investment';
        $user = Auth::user();
        $plan = Plan::where('status', 1)->get();
        $emptyMessage = 'Data Not Found';
        return view($this->activeTemplate.'user.investment.new', compact('pageTitle', 'user', 'plan', 'emptyMessage'));
    }


    public function newinvestment($id){
        $pageTitle = 'New Investment';
        $user = Auth::user();
        $now = Carbon::now();
        $plan = Plan::where('status', 1)->whereId($id)->first();
         if($now >= $plan->start_at)
         {
         $notify[] = ['error', 'Investment Pool has already started'];
         return redirect()->back()->withNotify($notify);
         }
        $time = PlanTimer::where('time',$plan->timer)->first();
        $emptyMessage = 'Data Not Found';
        return view($this->activeTemplate.'user.investment.invest', compact('pageTitle', 'user', 'time','plan', 'emptyMessage'));
    }



    public function investment(Request $request){

        $request->validate([
            'amount'=> 'required|numeric|gt:0',
            'plan'=> 'required|numeric|gt:0'
        ]);

        $findPlan = Plan::where('id', $request->plan)->where('status', 1)->firstOrFail();

        if($findPlan->min_amount > $request->amount || $findPlan->max_amount < $request->amount){
            $notify[] = ['error', 'Amount must be between'.showAmount($findPlan->min_amount).' and '.showAmount($findPlan->max_amount)];
            return redirect()->back()->withNotify($notify);
        }

        $user = Auth::user();

        if($findPlan->usd == 0)
        {
            if($user->balance < $request->amount){
            $notify[] = ['error', 'Sorry you dont have sufficient balance'];
            return redirect()->route('user.deposit')->withNotify($notify);
            }
        }
        if($findPlan->usd == 1)
        {
            if($user->usdbalance < $request->amount){
            $notify[] = ['error', 'Sorry you dont have sufficient USD balance'];
            return redirect()->route('user.deposit')->withNotify($notify);
            }
        }


        $perAnnuityInterest = 0;
        $nextReturn = Carbon::now()->addDay(1);

        if($findPlan->interest_type == 0){
            $perAnnuityInterest = $findPlan->interest_amount;
        }else{
            $perAnnuityInterest = ($request->amount * $findPlan->interest_amount) / 100;
        }

        $newInvest = new Investment();
        $newInvest->trx = getTrx();
        $newInvest->plan_id = $findPlan->id;
        $newInvest->user_id = $user->id;
        $newInvest->amount = $request->amount;
        $newInvest->interest_type = $findPlan->interest_type;
        $newInvest->interest_amount = $perAnnuityInterest;
        $newInvest->total_return = $findPlan->total_return;
        $newInvest->next_return_date = $nextReturn;
        $newInvest->compound = $request->compound;

        if($findPlan->usd == 1)
        {
        $newInvest->usd = 1;
        }
        else
        {
        $newInvest->usd = 0;
        }

        $newInvest->status = 2;
        $newInvest->save();

        $user->balance -= $request->amount;
        $user->save();

        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->amount = $request->amount;
        $transaction->post_balance = $user->balance;
        $transaction->charge = 0;
        $transaction->trx_type = '-';
        $transaction->details = 'Investment in '.$findPlan->name;
        $transaction->trx =  $newInvest->trx;
        $transaction->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = $user->id;
        $adminNotification->title = 'New Investment In '.$findPlan->name.' from '.$user->username;
        $adminNotification->click_url = urlPath('admin.users.investment',$user->id);
        $adminNotification->save();

        $general = GeneralSetting::first();


        if($general->invest_commission == 1){
                $commissionType =  'Commission Rewarded For '. number_format($request->amount) . ' '.$general->cur_text.' Investment';
                levelCommision($user->id, $request->amount, $commissionType);
        }


        notify($user, 'INVESTMENT', [
            'currency' => $general->cur_text,
            'trx' => $transaction->trx,
            'plan' => $findPlan->name,
            'amount' => $request->amount,
            'details' => $transaction->details,
            'post_balance' => $user->balance,
            'interest' => $perAnnuityInterest,
            'total_return' => $newInvest->total_return
        ]);

        $notify[] = ['success', 'Successfully investment in '.$findPlan->name];
        return redirect()->route('user.investment.log')->withNotify($notify);

    }

    public function investmentLog(){
        $pageTitle = 'Investment Log';
        $user = Auth::user();
        $logs = Investment::where('user_id', $user->id)->latest()->paginate(getPaginate());
        $emptyMessage = 'Data Not Found';
        return view($this->activeTemplate.'user.investment.investment_log', compact('pageTitle', 'user', 'logs', 'emptyMessage'));
    }


   public function kyc()
    {
        $pageTitle = 'Account Verification';
        $empty_message = 'No Verification Documents found.';
        $kyc = Kyc::where('user_id', Auth::id())->latest()->first();
        $document = Kycsetting::where('status', 1)->orderBy('type','asc')->get();
        return view($this->activeTemplate.'user.verification.kyc', compact('pageTitle', 'empty_message', 'kyc','document'));
    }

     public function postkyc(Request $request)
    {
        $user = User::findOrFail(Auth::id());
        $exist = Kyc::whereUser_id(Auth::id())->whereStatus(0)->count();
        if($exist > 0)
        {
        $notify[] = ['warning', 'You have already uploaded a document and its under review, Please hold on for verification.'];
        return back()->withNotify($notify);
        }

        $exist = Kyc::whereUser_id(Auth::id())->whereStatus(1)->first();
        if($exist)
        {
        $notify[] = ['warning', 'You have already completed the verification process.'];
        return back()->withNotify($notify);
        }


        $request->validate([
            'type' => 'required|string|max:50',
            'expiry' => 'required|string|max:50',
           'image' => 'mimes:png,jpg,jpeg'
        ],[
            'type.required'=>'ID type Field is required',
            'expiry.required'=>'ID expiry Field is required'
        ]);


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $filename = time() . 'kyc' . $user->username . '.jpg';
            $location = imagePath()['profile']['user']['path'];
            $size = imagePath()['profile']['user']['size'];
            if (file_exists($filename)) {
                @unlink($filename);
            }
            $filename = uploadImage($request->image, $location, $size, $user->image);

        }

            $w['type'] = $request->type; // ID Type
            $w['user_id'] = Auth::id();
            $w['expiry'] = $request->expiry; // ID Expiry Date
            $w['number'] = $request->number;
            $w['front'] = $filename;
            $w['address'] = $request->address;
            $w['city'] = $request->city;
            $w['state'] = $request->state;
            $w['country'] = $request->country;
            $w['zip'] = $request->zip;
            $w['status'] = 0;
            $result = Kyc::create($w);

           $notify[] = ['success', 'KYC Submited successfully.'];
           return back()->withNotify($notify);
    }




    //Support Ticket
    public function support()
    {
        $pageTitle = "Support Tickect";
        $supports = SupportTicket::where('user_id', Auth::id())->latest()->paginate(10);
       return view($this->activeTemplate.'user.support.index', compact('supports', 'pageTitle'));
    }

    public function supportnew()
    {
        $pageTitle = "Request Support";
        $user = Auth::user();
        $topics = Desk::all();
        return view($this->activeTemplate.'user.support.create', compact('pageTitle', 'user', 'topics'));
    }

    public function supportpost(Request $request)
    {
        $ticket = new SupportTicket();
        $message = new SupportMessage();

        $imgs = $request->file('attachments');
        $allowedExts = array('jpg', 'png', 'jpeg', 'pdf');

        $validator = $this->validate($request, [
            'attachments' => [
                'max:4096',
                function ($attribute, $value, $fail) use ($imgs, $allowedExts) {
                    foreach ($imgs as $img) {
                        $ext = strtolower($img->getClientOriginalExtension());

                        if (!in_array($ext, $allowedExts)) {
                            return $fail("Only png, jpg, jpeg, pdf images are allowed");
                        }
                    }
                    if (count($imgs) > 5) {
                        return $fail("Maximum 5 images can be uploaded");
                    }
                },
            ],
            'subject' => 'required|max:100',
            'department' => 'required',
            'priority' => 'required',
            'message' => 'required',
        ]);


        $ticket->user_id = Auth::id();
        $random = rand(100000, 999999);

        $ticket->ticket = 'S-' . $random;
        $ticket->name = Auth::user()->fullname;
        $ticket->email = Auth::user()->email;
        $ticket->subject = $request->subject;
        $ticket->department = $request->department;
        $ticket->priority = $request->priority;
        $ticket->status = 0;
        $ticket->save();

        $message->supportticket_id = $ticket->id;
        $message->type = 1;
        $message->message = $request->message;
        $message->save();


        if ($request->hasFile('attachments')) {
            foreach ($request->file('attachments') as $image) {
                $filename = rand(1000, 9999) . time() . '.' . $image->getClientOriginalExtension();
                $image->move('assets/images/support', $filename);
                SupportAttachment::create([
                    'support_message_id' => $message->id,
                    'image' => $filename,
                ]);
            }
        }
        $notify[] = ['success', 'ticket created successfully!'];
        return back()->withNotify($notify);
    }

    public function supportview($ticket)
    {
        $pageTitle = "View Ticket";
        $my_ticket = SupportTicket::where('ticket', $ticket)->latest()->first();
        $messages = SupportMessage::where('supportticket_id', $my_ticket->id)->latest()->get();
        $user = Auth::user();
        $topics = Desk::all();
        if ($my_ticket->user_id == Auth::id()) {
           return view($this->activeTemplate.'user.support.view', compact('my_ticket', 'messages', 'pageTitle', 'user', 'topics'));
        } else {
            return abort(404);
        }

    }

    public function supportMessageStore(Request $request, $id)
    {
        $ticket = SupportTicket::findOrFail($id);
        $message = new SupportMessage();

        if ($ticket->status != 3) {

            if ($request->replayTicket == 1) {
                $imgs = $request->file('attachments');
                $allowedExts = array('jpg', 'png', 'jpeg', 'pdf');

                $this->validate($request, [
                    'attachments' => [
                        'max:4096',
                        function ($attribute, $value, $fail) use ($imgs, $allowedExts) {
                            foreach ($imgs as $img) {
                                $ext = strtolower($img->getClientOriginalExtension());
                                if (($img->getClientSize() / 1000000) > 2) {
                                    return $fail("Images MAX  2MB ALLOW!");
                                }
                                if (!in_array($ext, $allowedExts)) {
                                    return $fail("Only png, jpg, jpeg, pdf images are allowed");
                                }
                            }
                            if (count($imgs) > 5) {
                                return $fail("Maximum 5 images can be uploaded");
                            }
                        },
                    ],
                    'message' => 'required',
                ]);

                $ticket->status = 2;
                $ticket->save();

                $message->supportticket_id = $ticket->id;
                $message->type = 1;
                $message->message = $request->message;
                $message->save();

                if ($request->hasFile('attachments')) {
                    foreach ($request->file('attachments') as $image) {
                        $filename = rand(1000, 9999) . time() . '.' . $image->getClientOriginalExtension();
                        $image->move('assets/images/support', $filename);
                        SupportAttachment::create([
                            'support_message_id' => $message->id,
                            'image' => $filename,
                        ]);
                    }
                }

                 $notify[] = ['success', 'Support ticket replied successfully!'];
                 return back()->withNotify($notify);


            } elseif ($request->replayTicket == 2) {
                $ticket->status = 3;
                $ticket->save();
                $notify = ['success', 'Support ticket closed successfully!'];
                return back()->withNotify($notify);
            }

        } else {
            $notify = ['error', 'Support ticket already closed!'];
            return back()->withNotify($notify);
        }
         $notify[] = ['success', 'Support ticket replied successfully!'];
                 return back()->withNotify($notify);

    }

    public function ticketDownload($ticket_id)
    {
        $attachment = SupportAttachment::findOrFail(decrypt($ticket_id));
        $file = $attachment->image;
        $full_path = 'assets/images/support/' . $file;

        $title = str_slug($attachment->supportMessage->ticket->subject);
        $ext = pathinfo($file, PATHINFO_EXTENSION);
        $mimetype = mime_content_type($full_path);


        header('Content-Disposition: attachment; filename="' . $title . '.' . $ext . '";');
        header("Content-Type: " . $mimetype);
        return readfile($full_path);
    }

    public function ticketDelete(Request $request)
    {
        $message = SupportMessage::where('id', $request->message_id)->latest()->firstOrFail();

        if ($message->ticket->user_id != Auth::id()) {
            $notify[] = ['error', 'Unauthorized!'];
            return back()->withNotify($notify);
        }

        if ($message->attachments()->count() > 0) {
            foreach ($message->attachments as $img) {
                @unlink('assets/images/support/' . $img->image);
                $img->delete();
            }
        }
        $message->delete();

        $notify[] = ['success', 'Deleted successfully.'];
        return back()->withNotify($notify);
    }

}
