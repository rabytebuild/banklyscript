<?php

use Illuminate\Support\Facades\Route;

Route::get('/clear', function(){
    \Illuminate\Support\Facades\Artisan::call('optimize:clear');
});
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

Route::namespace('Gateway')->prefix('ipn')->name('ipn.')->group(function () {
    Route::post('paypal', 'Paypal\ProcessController@ipn')->name('Paypal');
    Route::get('paypal-sdk', 'PaypalSdk\ProcessController@ipn')->name('PaypalSdk');
    Route::post('perfect-money', 'PerfectMoney\ProcessController@ipn')->name('PerfectMoney');
    Route::post('stripe', 'Stripe\ProcessController@ipn')->name('Stripe');
    Route::post('stripe-js', 'StripeJs\ProcessController@ipn')->name('StripeJs');
    Route::post('stripe-v3', 'StripeV3\ProcessController@ipn')->name('StripeV3');
    Route::post('skrill', 'Skrill\ProcessController@ipn')->name('Skrill');
    Route::post('paytm', 'Paytm\ProcessController@ipn')->name('Paytm');
    Route::post('payeer', 'Payeer\ProcessController@ipn')->name('Payeer');
    Route::post('paystack', 'Paystack\ProcessController@ipn')->name('Paystack');
    Route::post('voguepay', 'Voguepay\ProcessController@ipn')->name('Voguepay');
    Route::get('flutterwave/{trx}/{type}', 'Flutterwave\ProcessController@ipn')->name('Flutterwave');
    Route::post('razorpay', 'Razorpay\ProcessController@ipn')->name('Razorpay');
    Route::post('instamojo', 'Instamojo\ProcessController@ipn')->name('Instamojo');
    Route::get('blockchain', 'Blockchain\ProcessController@ipn')->name('Blockchain');
    Route::get('blockio', 'Blockio\ProcessController@ipn')->name('Blockio');
    Route::post('coinpayments', 'Coinpayments\ProcessController@ipn')->name('Coinpayments');
    Route::post('coinpayments-fiat', 'Coinpayments_fiat\ProcessController@ipn')->name('CoinpaymentsFiat');
    Route::post('coingate', 'Coingate\ProcessController@ipn')->name('Coingate');
    Route::post('coinbase-commerce', 'CoinbaseCommerce\ProcessController@ipn')->name('CoinbaseCommerce');
    Route::get('mollie', 'Mollie\ProcessController@ipn')->name('Mollie');
    Route::post('cashmaal', 'Cashmaal\ProcessController@ipn')->name('Cashmaal');
});


/*
|--------------------------------------------------------------------------
| Start Admin Area
|--------------------------------------------------------------------------
*/
 Route::namespace('Auth')->group(function ()
 {
 Route::get('/register/{ref}', 'RegisterController@showform');
 });


Route::namespace('Admin')->prefix('admin')->name('admin.')->group(function () {
    Route::namespace('Auth')->group(function () {
        Route::get('/login', 'LoginController@showLoginForm')->name('login');
        Route::get('/', 'LoginController@showLoginForm');

        Route::post('/', 'LoginController@login')->name('login');
        Route::get('logout', 'LoginController@logout')->name('logout');
        // Admin Password Reset
        Route::get('password/reset', 'ForgotPasswordController@showLinkRequestForm')->name('password.reset');
        Route::post('password/reset', 'ForgotPasswordController@sendResetCodeEmail');
        Route::post('password/verify-code', 'ForgotPasswordController@verifyCode')->name('password.verify.code');
        Route::get('password/reset/{token}', 'ResetPasswordController@showResetForm')->name('password.reset.form');
        Route::post('password/reset/change', 'ResetPasswordController@reset')->name('password.change');
    });

    Route::middleware('admin')->group(function () {
        Route::get('dashboard', 'AdminController@dashboard')->name('dashboard');
        Route::get('profile', 'AdminController@profile')->name('profile');
        Route::post('profile', 'AdminController@profileUpdate')->name('profile.update');
        Route::get('password', 'AdminController@password')->name('password');
        Route::post('password', 'AdminController@passwordUpdate')->name('password.update');

         //refer
        Route::get('/referral', 'AdminController@refIndex')->name('referral.index');
        Route::post('/referral', 'AdminController@refStore')->name('store.refer');
        Route::post('/referral/feature', 'AdminController@refupdate')->name('store.feature');


        //Notification
        Route::get('notifications','AdminController@notifications')->name('notifications');
        Route::get('notification/read/{id}','AdminController@notificationRead')->name('notification.read');
        Route::get('notifications/read-all','AdminController@readAll')->name('notifications.readAll');

        // Users Manager
        Route::get('create/user', 'ManageUsersController@createUser')->name('users.create');
        Route::post('create/user', 'ManageUsersController@createUserpost');
        Route::get('users', 'ManageUsersController@allUsers')->name('users.all');
        Route::get('users/active', 'ManageUsersController@activeUsers')->name('users.active');
        Route::get('users/banned', 'ManageUsersController@bannedUsers')->name('users.banned');
        Route::get('users/email-verified', 'ManageUsersController@emailVerifiedUsers')->name('users.email.verified');
        Route::get('users/email-unverified', 'ManageUsersController@emailUnverifiedUsers')->name('users.email.unverified');
        Route::get('users/sms-unverified', 'ManageUsersController@smsUnverifiedUsers')->name('users.sms.unverified');
        Route::get('users/sms-verified', 'ManageUsersController@smsVerifiedUsers')->name('users.sms.verified');
        Route::get('users/with-balance', 'ManageUsersController@usersWithBalance')->name('users.with.balance');


        Route::get('kyc-settings', 'ManageUsersController@kycsettings')->name('users.kyc.settings');
        Route::post('kyc-settings', 'ManageUsersController@kycsettingspost');
        Route::post('edit-kyc-settings', 'ManageUsersController@editkycsettings')->name('users.kyc.editsettings');
        Route::get('users/kyc-verified', 'ManageUsersController@kycVerifiedUsers')->name('users.kyc.verified');
        Route::get('users/kyc-unverified', 'ManageUsersController@kycunVerifiedUsers')->name('users.kyc.unverified');
        Route::get('users/kyc-view/{id}', 'ManageUsersController@viewkyc')->name('users.viewkyc');
        Route::get('users/kyc-verify/{id}', 'ManageUsersController@verifykyc')->name('users.verifykyc');
        Route::get('users/kyc-decline/{id}', 'ManageUsersController@declinekyc')->name('users.declinekyc');

        Route::get('users/{scope}/search', 'ManageUsersController@search')->name('users.search');
        Route::get('user/detail/{id}', 'ManageUsersController@detail')->name('users.detail');
        Route::post('user/update/{id}', 'ManageUsersController@update')->name('users.update');
        Route::post('user/add-investment-plan/{id}', 'ManageUsersController@addplan')->name('users.add.plan');
        Route::post('user/add-sub-balance/{id}', 'ManageUsersController@addSubBalance')->name('users.add.sub.balance');
        Route::post('user/add-compound/{id}', 'ManageUsersController@addcompound')->name('users.add.compound');
        Route::get('user/send-email/{id}', 'ManageUsersController@showEmailSingleForm')->name('users.email.single');
        Route::post('user/send-email/{id}', 'ManageUsersController@sendEmailSingle')->name('users.email.single');
        Route::get('user/login/{id}', 'ManageUsersController@login')->name('users.login');
        Route::get('user/transactions/{id}', 'ManageUsersController@transactions')->name('users.transactions');
        Route::get('user/deposits/{id}', 'ManageUsersController@deposits')->name('users.deposits');
        Route::get('user/deposits/via/{method}/{type?}/{userId}', 'ManageUsersController@depositViaMethod')->name('users.deposits.method');
        Route::get('user/withdrawals/{id}', 'ManageUsersController@withdrawals')->name('users.withdrawals');
        Route::get('user/withdrawals/via/{method}/{type?}/{userId}', 'ManageUsersController@withdrawalsViaMethod')->name('users.withdrawals.method');


        // Login History
        Route::get('users/login/history/{id}', 'ManageUsersController@userLoginHistory')->name('users.login.history.single');

        // Support Ticket
        Route::get('users/tickets/open', 'ManageUsersController@openticket')->name('users.open.ticket');
        Route::get('users/tickets/replied', 'ManageUsersController@repliedticket')->name('users.replied.ticket');
        Route::get('users/tickets/closed', 'ManageUsersController@closedticket')->name('users.closed.ticket');
        Route::get('users/tickets/view/{id}', 'ManageUsersController@supportview')->name('user.ticket.view');
        Route::post('users/tickets/reply/{id}', 'ManageUsersController@supportMessageReply')->name('user.ticket.reply');
        Route::get('users/tickets/download/{id}', 'ManageUsersController@ticketDownload')->name('user.ticket.download');

        Route::get('users/send-email', 'ManageUsersController@showEmailAllForm')->name('users.email.all');
        Route::post('users/send-email', 'ManageUsersController@sendEmailAll')->name('users.email.send');
        Route::get('users/email-log/{id}', 'ManageUsersController@emailLog')->name('users.email.log');
        Route::get('users/email-details/{id}', 'ManageUsersController@emailDetails')->name('users.email.details');

        Route::get('users/investment/{id}', 'ManageUsersController@investment')->name('users.investment');

        Route::get('timer', 'PlanController@timer')->name('plan.timer');
        Route::post('timer/create', 'PlanController@timercreate')->name('timer.create');
        Route::post('timer/edit', 'PlanController@timeredit')->name('timer.edit');
        Route::get('plans', 'PlanController@index')->name('plan.index');
        Route::post('plan-create', 'PlanController@create')->name('plan.create');
        Route::post('plan-edit', 'PlanController@edit')->name('plan.edit');

        Route::get('investment-log', 'PlanController@investLog')->name('plan.invest.log');
        Route::get('investment-start/{id}', 'PlanController@start')->name('plan.start');



        // Deposit Gateway
        Route::name('gateway.')->prefix('gateway')->group(function(){
            // Automatic Gateway
            Route::get('automatic', 'GatewayController@index')->name('automatic.index');
            Route::get('automatic/edit/{alias}', 'GatewayController@edit')->name('automatic.edit');
            Route::post('automatic/update/{code}', 'GatewayController@update')->name('automatic.update');
            Route::post('automatic/remove/{code}', 'GatewayController@remove')->name('automatic.remove');
            Route::post('automatic/activate', 'GatewayController@activate')->name('automatic.activate');
            Route::post('automatic/deactivate', 'GatewayController@deactivate')->name('automatic.deactivate');


            // Manual Methods
            Route::get('manual', 'ManualGatewayController@index')->name('manual.index');
            Route::get('manual/new', 'ManualGatewayController@create')->name('manual.create');
            Route::post('manual/new', 'ManualGatewayController@store')->name('manual.store');
            Route::get('manual/edit/{alias}', 'ManualGatewayController@edit')->name('manual.edit');
            Route::post('manual/update/{id}', 'ManualGatewayController@update')->name('manual.update');
            Route::post('manual/activate', 'ManualGatewayController@activate')->name('manual.activate');
            Route::post('manual/deactivate', 'ManualGatewayController@deactivate')->name('manual.deactivate');
        });


        // DEPOSIT SYSTEM
        Route::name('deposit.')->prefix('deposit')->group(function(){
            Route::get('/', 'DepositController@deposit')->name('list');
            Route::get('pending', 'DepositController@pending')->name('pending');
            Route::get('rejected', 'DepositController@rejected')->name('rejected');
            Route::get('approved', 'DepositController@approved')->name('approved');
            Route::get('successful', 'DepositController@successful')->name('successful');
            Route::get('details/{id}', 'DepositController@details')->name('details');

            Route::post('reject', 'DepositController@reject')->name('reject');
            Route::post('approve', 'DepositController@approve')->name('approve');
            Route::get('via/{method}/{type?}', 'DepositController@depositViaMethod')->name('method');
            Route::get('/{scope}/search', 'DepositController@search')->name('search');
            Route::get('date-search/{scope}', 'DepositController@dateSearch')->name('dateSearch');

        });


         // LOAN SYSTEM
        Route::name('loan.')->prefix('loan')->group(function(){
        Route::get('/', 'LoanController@index')->name('index');
        Route::post('/create', 'LoanController@create')->name('create');
        Route::post('/edit', 'LoanController@edit')->name('edit');
        Route::get('/request', 'LoanController@request')->name('request');
        Route::get('/approveloan/{id}', 'LoanController@approveloan')->name('approveloan');
        Route::get('/rejectloan/{id}', 'LoanController@rejectloan')->name('rejectloan');
        Route::get('/active', 'LoanController@active')->name('active');
        Route::get('/closed', 'LoanController@closed')->name('closed');
        Route::get('/declined', 'LoanController@declined')->name('declined');
        Route::get('/view/{id}', 'LoanController@view')->name('view');
        Route::post('/pay/{id}', 'LoanController@pay')->name('pay');
        Route::post('/close/{id}', 'LoanController@close')->name('close');
        });


         // SAVINGS SYSTEM
        Route::name('savings.')->prefix('savings')->group(function(){
        Route::get('/target', 'SavingsController@target')->name('target');
        Route::get('/recurrent', 'SavingsController@recurrent')->name('recurrent');
        Route::get('/view/{id}', 'SavingsController@view')->name('view');
        });

         // VIRTUAL CARD SYSTEM
        Route::name('card.')->prefix('card')->group(function(){
        Route::get('/active', 'CardController@active')->name('active');
        Route::get('/inactive', 'CardController@inactive')->name('inactive');
        Route::get('/view/{id}', 'CardController@view')->name('view');
        Route::post('/fund/{id}', 'CardController@fundcard')->name('fundcard');
        Route::get('/block/{id}', 'CardController@block')->name('block');
        Route::get('/unblock/{id}', 'CardController@unblock')->name('unblock');
        Route::get('/terminate/{id}', 'CardController@terminate')->name('terminate');
        Route::post('/card-statement/{id}', 'CardController@trxcard')->name('trxcard');
        });

         // TRANSFER SYSTEM
        Route::name('transfer.')->prefix('transfer')->group(function(){
        Route::get('/user', 'TransferController@user')->name('user');
        Route::get('/other', 'TransferController@other')->name('other');
        Route::get('/view/{id}', 'TransferController@view')->name('view');
        Route::post('/approve', 'TransferController@approve')->name('approve');
        Route::post('/reject', 'TransferController@reject')->name('reject');
        });


         // COIN SYSTEM
        Route::name('coin.')->prefix('coin')->group(function(){
        Route::get('/currency', 'CoinController@currency')->name('currency');
        Route::get('/edit/{id}', 'CoinController@edit')->name('edit');
        Route::post('/edit/{id}', 'CoinController@apiupdate')->name('edit');
        Route::get('/deactivate/{id}', 'CoinController@deactivate')->name('deactivate');
        Route::get('/activate/{id}', 'CoinController@activate')->name('activate');
        Route::get('/wallet', 'CoinController@wallet')->name('wallet');
        Route::get('/wallet/{id}', 'CoinController@viewwallet')->name('viewwallet');
        Route::get('/deactivatewallet/{id}', 'CoinController@deactivatewallet')->name('deactivatewallet');
        Route::get('/activatewallet/{id}', 'CoinController@activatewallet')->name('activatewallet');
        Route::get('/viewwallet/{id}', 'CoinController@viewwalletaddress')->name('viewwalletd');
        Route::post('/creditwallet/{id}', 'CoinController@creditwallet')->name('creditwallet');
        Route::post('/debitwallet/{id}', 'CoinController@debitwallet')->name('debitwallet');
        Route::post('/createwallet/{id}', 'CoinController@createwallet')->name('createwallet');
        Route::get('/swap', 'CoinController@swap')->name('swap');
        });


        // WITHDRAW SYSTEM
        Route::name('withdraw.')->prefix('withdraw')->group(function(){
            Route::get('pending', 'WithdrawalController@pending')->name('pending');
            Route::get('approved', 'WithdrawalController@approved')->name('approved');
            Route::get('rejected', 'WithdrawalController@rejected')->name('rejected');
            Route::get('log', 'WithdrawalController@log')->name('log');
            Route::get('via/{method_id}/{type?}', 'WithdrawalController@logViaMethod')->name('method');
            Route::get('{scope}/search', 'WithdrawalController@search')->name('search');
            Route::get('date-search/{scope}', 'WithdrawalController@dateSearch')->name('dateSearch');
            Route::get('details/{id}', 'WithdrawalController@details')->name('details');
            Route::post('approve', 'WithdrawalController@approve')->name('approve');
            Route::post('reject', 'WithdrawalController@reject')->name('reject');


            // Withdraw Method
            Route::get('method/', 'WithdrawMethodController@methods')->name('method.index');
            Route::get('method/create', 'WithdrawMethodController@create')->name('method.create');
            Route::post('method/create', 'WithdrawMethodController@store')->name('method.store');
            Route::get('method/edit/{id}', 'WithdrawMethodController@edit')->name('method.edit');
            Route::post('method/edit/{id}', 'WithdrawMethodController@update')->name('method.update');
            Route::post('method/activate', 'WithdrawMethodController@activate')->name('method.activate');
            Route::post('method/deactivate', 'WithdrawMethodController@deactivate')->name('method.deactivate');
        });

        // Report
        Route::get('report/transaction', 'ReportController@transaction')->name('report.transaction');
        Route::get('report/transaction/search', 'ReportController@transactionSearch')->name('report.transaction.search');
        Route::get('report/login/history', 'ReportController@loginHistory')->name('report.login.history');
        Route::get('report/login/ipHistory/{ip}', 'ReportController@loginIpHistory')->name('report.login.ipHistory');
        Route::get('report/email/history', 'ReportController@emailHistory')->name('report.email.history');
        Route::get('report/investment/log', 'ReportController@investLog')->name('report.plan.invest.log');


        Route::get('report/airtime', 'ReportController@airtime')->name('report.airtime');
        Route::get('report/internet', 'ReportController@internet')->name('report.internet');
        Route::get('report/cabletv', 'ReportController@cabletv')->name('report.cabletv');
        Route::get('report/utility', 'ReportController@utility')->name('report.utility');
        Route::get('report/waecreg', 'ReportController@waecreg')->name('report.waecreg');
        Route::get('report/waecres', 'ReportController@waecres')->name('report.waecres');


        // Language Manager
        Route::get('/language', 'LanguageController@langManage')->name('language.manage');
        Route::post('/language', 'LanguageController@langStore')->name('language.manage.store');
        Route::post('/language/delete/{id}', 'LanguageController@langDel')->name('language.manage.del');
        Route::post('/language/update/{id}', 'LanguageController@langUpdate')->name('language.manage.update');
        Route::get('/language/edit/{id}', 'LanguageController@langEdit')->name('language.key');
        Route::post('/language/import', 'LanguageController@langImport')->name('language.importLang');



        Route::post('language/store/key/{id}', 'LanguageController@storeLanguageJson')->name('language.store.key');
        Route::post('language/delete/key/{id}', 'LanguageController@deleteLanguageJson')->name('language.delete.key');
        Route::post('language/update/key/{id}', 'LanguageController@updateLanguageJson')->name('language.update.key');



        // General Setting
        Route::get('general-setting', 'GeneralSettingController@index')->name('setting.index');
        Route::post('general-setting', 'GeneralSettingController@update')->name('setting.update');

        // Logo-Icon
        Route::get('setting/logo-icon', 'GeneralSettingController@logoIcon')->name('setting.logo.icon');
        Route::post('setting/logo-icon', 'GeneralSettingController@logoIconUpdate')->name('setting.logo.icon');

        //Cookie
        Route::get('cookie','GeneralSettingController@cookie')->name('setting.cookie');
        Route::post('cookie','GeneralSettingController@cookieSubmit');


        // Plugin
        Route::get('live-chat-setup', 'ExtensionController@index')->name('extensions.index');
        Route::post('extensions/update/{id}', 'ExtensionController@update')->name('extensions.update');
        Route::post('extensions/activate', 'ExtensionController@activate')->name('extensions.activate');
        Route::post('extensions/deactivate', 'ExtensionController@deactivate')->name('extensions.deactivate');


        // Email Setting
        Route::get('email-template/global', 'EmailTemplateController@emailTemplate')->name('email.template.global');
        Route::post('email-template/global', 'EmailTemplateController@emailTemplateUpdate')->name('email.template.global');
        Route::get('email-template/setting', 'EmailTemplateController@emailSetting')->name('email.template.setting');
        Route::post('email-template/setting', 'EmailTemplateController@emailSettingUpdate')->name('email.template.setting');
        Route::get('email-template/index', 'EmailTemplateController@index')->name('email.template.index');
        Route::get('email-template/{id}/edit', 'EmailTemplateController@edit')->name('email.template.edit');
        Route::post('email-template/{id}/update', 'EmailTemplateController@update')->name('email.template.update');
        Route::post('email-template/send-test-mail', 'EmailTemplateController@sendTestMail')->name('email.template.test.mail');


        // SMS Setting
        Route::get('sms-template/global', 'SmsTemplateController@smsTemplate')->name('sms.template.global');
        Route::post('sms-template/global', 'SmsTemplateController@smsTemplateUpdate')->name('sms.template.global');
        Route::get('sms-template/setting','SmsTemplateController@smsSetting')->name('sms.templates.setting');
        Route::post('sms-template/setting', 'SmsTemplateController@smsSettingUpdate')->name('sms.template.setting');
        Route::get('sms-template/index', 'SmsTemplateController@index')->name('sms.template.index');
        Route::get('sms-template/edit/{id}', 'SmsTemplateController@edit')->name('sms.template.edit');
        Route::post('sms-template/update/{id}', 'SmsTemplateController@update')->name('sms.template.update');
        Route::post('email-template/send-test-sms', 'SmsTemplateController@sendTestSMS')->name('sms.template.test.sms');

        // SEO
        Route::get('seo', 'FrontendController@seoEdit')->name('seo');


        // Frontend
        Route::name('frontend.')->prefix('frontend')->group(function () {

            Route::get('frontend-sections/{key}', 'FrontendController@frontendSections')->name('sections');
            Route::post('frontend-content/{key}', 'FrontendController@frontendContent')->name('sections.content');
            Route::get('frontend-element/{key}/{id?}', 'FrontendController@frontendElement')->name('sections.element');
            Route::post('remove', 'FrontendController@remove')->name('remove');

        });
    });
});




/*
|--------------------------------------------------------------------------
| Start User Area
|--------------------------------------------------------------------------
*/


Route::name('user.')->group(function () {

    Route::get('/login', 'Auth\LoginController@loginpage')->name('loginpage');
    Route::post('/login', 'Auth\LoginController@login')->name('login');
    Route::get('logout', 'Auth\LoginController@logout')->name('logout');


    Route::get('/register', 'Auth\RegisterController@showform')->name('register');
    Route::post('register', 'Auth\RegisterController@register')->middleware('regStatus');

    Route::get('/password/reset', 'Auth\ForgotPasswordController@resetpassword')->name('password.request');
    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetCodeEmail')->name('password.email');
    Route::get('password/code-verify', 'Auth\ForgotPasswordController@codeVerify')->name('password.code.verify');
    Route::post('password/reset/page', 'Auth\ResetPasswordController@reset')->name('password.update');
    Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
    Route::post('password/verify-code', 'Auth\ForgotPasswordController@verifyCode')->name('password.verify.code');
});

Route::name('user.')->prefix('user')->group(function () {
    Route::middleware('auth')->group(function () {
        Route::get('authorization', 'AuthorizationController@authorizeForm')->name('authorization');
        Route::get('resend-verify', 'AuthorizationController@sendVerifyCode')->name('send.verify.code');
        Route::post('verify-email', 'AuthorizationController@emailVerification')->name('verify.email');
        Route::post('verify-sms', 'AuthorizationController@smsVerification')->name('verify.sms');
        Route::post('verify-g2fa', 'AuthorizationController@g2faVerification')->name('go2fa.verify');

        Route::middleware(['checkStatus'])->group(function () {
            Route::get('dashboard', 'UserController@home')->name('home');
            Route::get('coming_soon', 'UserController@soon')->name('api');

            Route::get('profile-setting', 'UserController@profile')->name('profile.setting');
            Route::post('profile-setting', 'UserController@submitProfile');
            Route::get('referral-setting', 'UserController@ref')->name('profile.ref');
            Route::get('change-password', 'UserController@changePassword')->name('change.password');
            Route::post('change-password', 'UserController@submitPassword');

            //2FA
            Route::get('twofactor', 'UserController@show2faForm')->name('twofactor');
            Route::post('twofactor/enable', 'UserController@create2fa')->name('twofactor.enable');
            Route::post('twofactor/disable', 'UserController@disable2fa')->name('twofactor.disable');


            // KYC
            Route::get('verification/kyc', 'UserController@kyc')->name('kyc');
            Route::post('verification/kyc', 'UserController@postkyc')->name('kycpost');


            // Support
            Route::get('suport/request', 'UserController@support')->name('support');
            Route::get('suport/create', 'UserController@supportnew')->name('ticket.open');
            Route::post('support/create', 'UserController@supportpost')->name('ticket.create');
            Route::get('suport/view/{id}', 'UserController@supportview')->name('ticket.view');
            Route::post('suport/reply/{id}', 'UserController@supportMessageStore')->name('ticket.reply');
            Route::get('suport/download/{id}', 'UserController@ticketDownload')->name('ticket.download');
            Route::get('suport/delete/{id}', 'UserController@ticketDelete')->name('ticket.delete');


            // Deposit
            Route::any('/deposit', 'Gateway\PaymentController@deposit')->name('deposit');
            Route::post('deposit/insert', 'Gateway\PaymentController@depositInsert')->name('deposit.insert');
            Route::get('deposit/preview', 'Gateway\PaymentController@depositPreview')->name('deposit.preview');
            Route::get('deposit/confirm', 'Gateway\PaymentController@depositConfirm')->name('deposit.confirm');
            Route::get('deposit/manual', 'Gateway\PaymentController@manualDepositConfirm')->name('deposit.manual.confirm');
            Route::post('deposit/manual', 'Gateway\PaymentController@manualDepositUpdate')->name('deposit.manual.update');
            Route::get('deposit/history', 'UserController@depositHistory')->name('deposit.history');

            // Withdraw
            Route::get('/withdraw', 'UserController@withdrawMoney')->name('withdraw');
            Route::post('/withdraw', 'UserController@withdrawStore')->name('withdraw.money');

            Route::get('/withdraw/compound', 'UserController@withdrawCompound')->name('withdraw.compound');
            Route::post('/withdraw/compound', 'UserController@withdrawCompoundStore');
            Route::get('/withdraw/preview', 'UserController@withdrawPreview')->name('withdraw.preview');
            Route::post('/withdraw/preview', 'UserController@withdrawSubmit')->name('withdraw.submit');
            Route::get('/withdraw/history', 'UserController@withdrawLog')->name('withdraw.history');

            Route::get('/trx/log', 'UserController@trxLog')->name('trx.log');
            Route::post('/trx/log', 'UserController@trxLog');
            Route::get('/new/savings', 'UserController@savings')->name('savings');
            Route::get('/investment', 'UserController@investmentnew')->name('investment.new');
            Route::get('/investment/{id}', 'UserController@newinvestment')->name('newinvestment');
            Route::post('/investment', 'UserController@investment')->name('investment');
            Route::get('/investment/pool/log', 'UserController@investmentLog')->name('investment.log');

            //Loan
            Route::get('/request/loan', 'LoanController@requestloan')->name('loan.request');
            Route::post('/request/loan', 'LoanController@requestsubmit');
            Route::get('/my-loan', 'LoanController@myloan')->name('myloan');
            Route::get('/loan/{id}', 'LoanController@viewloan')->name('viewloan');
            Route::post('/loan-pay/{id}', 'LoanController@loanpay')->name('loan.pay');


            //Savings
            Route::get('/request/savings', 'SavingsController@requestsavings')->name('savings.request');
            Route::post('/request/savings', 'SavingsController@requestsubmit');
            Route::get('/my-savings', 'SavingsController@mysavings')->name('mysavings');
            Route::get('/savings/{id}', 'SavingsController@viewsaved')->name('viewsaved');
            Route::post('/savings/{id}', 'SavingsController@savenow')->name('save.pay');


            //Virtual Card
            Route::get('/virtual-Card', 'VirtualCardController@requestcard')->name('vcard');
            Route::post('/virtual-Card', 'VirtualCardController@requestsubmit');
            Route::get('/virtual-Card/{id}', 'VirtualCardController@viewcard')->name('view.card');
            Route::get('/block-Card/{id}', 'VirtualCardController@blockcard')->name('card.block');
            Route::get('/unblock-Card/{id}', 'VirtualCardController@unblockcard')->name('card.unblock');
            Route::post('/fund-Card/{id}', 'VirtualCardController@fundcard')->name('fundcard');
            Route::post('/Trx-Card/{id}', 'VirtualCardController@trxcard')->name('trxcard');


            //Fund Card
            Route::get('/transfer-Fund', 'UserController@usertransfer')->name('usertransfer');
            Route::post('/transfer-Fund', 'UserController@requestsubmit');
            Route::get('/transfer-Fund/preview', 'UserController@usertransferpreview')->name('usertransfer.preview');
            Route::post('/transfer-Fund/preview', 'UserController@usertransfersend');
            Route::get('/deletebeneficiary/{id}', 'UserController@deletebeneficiary')->name('deletebeneficiary');


            Route::get('/other-transfer-Fund', 'UserController@othertransfer')->name('othertransfer');
            Route::post('/other-transfer-Fund', 'UserController@othertransfersubmit');
            Route::get('/transfer-Other/preview', 'UserController@transferpreviewother')->name('transfer.previewother');
            Route::post('/transfer-Other/preview', 'UserController@transferpreviewothersubmit');

             //Blockchain Wallet
            Route::get('wallet/{id}','WalletController@wallet')->name('wallet');
            Route::post('create/wallet/{id}','WalletController@createwallet')->name('createwallet');
            Route::post('create/sendfromwallet','WalletController@sendfromwallet')->name('sendfromwallet');
            Route::get('view/wallet/{id}','WalletController@viewwallet')->name('viewwallet');

             //Swap
            Route::get('currency/swapcoin', 'WalletController@swapcoin')->name('swapcoin');
            Route::post('currency/swapcoin', 'WalletController@swapcoinpost');


            //Bill Payment System
            Route::get('bill/airtime', 'BillsController@airtime')->name('airtime');
            Route::post('bill/airtime', 'BillsController@airtimebuy');
            Route::get('bill/internet', 'BillsController@internet')->name('internet');
            Route::post('bill/internet', 'BillsController@loadinternet');
            Route::get('bill/cabletv', 'BillsController@cabletv')->name('cabletv');
            Route::post('bill/cabletv', 'BillsController@validatedecoder');
            Route::get('bill/cabletv/pay', 'BillsController@decodervalidated')->name('decodervalidated');
            Route::post('bill/cabletv/pay', 'BillsController@decoderpay');
            Route::get('bill/utility', 'BillsController@utility')->name('utility');
            Route::post('bill/utility', 'BillsController@validatebill');
            Route::get('bill/validated', 'BillsController@billvalidated')->name('billvalidated');
            Route::post('bill/validated', 'BillsController@billpay');
            Route::get('utility-token/{id}', 'BillsController@utilitytoken')->name('utilitytoken');
            Route::get('bill/waec/register', 'BillsController@waecreg')->name('waec.reg');
            Route::post('bill/waec/register/{id}', 'BillsController@waecregpost')->name('registerwaec');
            Route::get('bill/waec/result', 'BillsController@waecresult')->name('waec.result');
            Route::post('bill/waec/result/{id}', 'BillsController@resultwaecpost')->name('resultwaec');




        });
    });
});


Route::prefix('cron')->name('cron.')->group(function(){
    Route::get('/webhook', 'CronController@webhook')->name('webhook');
    Route::get('/investment', 'CronController@investment')->name('investment');
    Route::get('/loan', 'CronController@loan')->name('loan');
    Route::get('/savings', 'CronController@savings')->name('savings');
});


Route::get('/privacy/page/{slug}/{id}', 'SiteController@privacyPage')->name('privacy.page');
Route::get('/contact', 'SiteController@contact')->name('contact');
Route::post('/contact', 'SiteController@contactSubmit');
Route::get('/change/{lang?}', 'SiteController@changeLanguage')->name('lang');

Route::get('/cookie/accept', 'SiteController@cookieAccept')->name('cookie.accept');

Route::get('placeholder-image/{size}', 'SiteController@placeholderImage')->name('placeholder.image');

Route::get('/{slug}', 'SiteController@pages')->name('pages');
Route::get('/', 'SiteController@index')->name('home');
