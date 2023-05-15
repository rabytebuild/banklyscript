<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Installer">
    <meta name="author" content="Bankly Fintech">
    <title>Installer </title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="installer_files/img/logo.png" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="installer_files/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="installer_files/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="installer_files/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="installer_files/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="installer_files/css/bootstrap.min.css" rel="stylesheet">
	<link href="installer_files/css/menu.css" rel="stylesheet">
    <link href="installer_files/css/style.css" rel="stylesheet">
	<link href="installer_files/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="installer_files/css/custom.css" rel="stylesheet">
	
	<!-- MODERNIZR MENU -->
	<script src="installer_files/js/modernizr.js"></script>
	
	<script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-11097556-8']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();
    </script>

</head>

<body>
	
	<!--<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	
	<div id="loader_form">
		<div data-loader="circle-side-2"></div>
	</div>-->
	
	
	
	<div class="container-fluid full-height">
		<div class="row row-height">
			<div class="col-lg-6 content-left">
				<div class="content-left-wrapper">
					
					<div>
						<figure><img src="installer_files/img/logo.png" alt="" class="img-fluid"></figure>
						<h2>Installation Wizard</h2>
						<p>Please follow the installation guide/wizard to install this software on your server. Please note that we reserve the right to revoke licence of this script if you use on more than one server for regular licence </p>
						
					</div>
					<div class="copy">&copy;2021 - All Right Reserved by Bankly-Fintech</div>
				</div>
				<!-- /content-left-wrapper -->
			</div>
			<!-- /content-left -->

			<div class="col-lg-6 content-right" id="start">
				<div id="wizard_container">
					<div id="top-wizard">
							<div id="progressbar"></div>
						</div>
						<!-- /top-wizard -->
						<?php 
			error_reporting(0);
			function isExtensionAvailable($name){
				if (!extension_loaded($name)) {
					$response = false;
				} else {
					$response = true;
				}
				return $response;
			}
			function checkFolderPerm($name){
				$perm = substr(sprintf('%o', fileperms($name)), -4);
				if ($perm >= '0775') {
					$response = true;
				} else {
					$response = false;
				}
				return $response;
			}
			function tableRow($name, $details, $status){
				if ($status=='1') {
				$i = 1;
					$pr = '
					<span class="rating">
					<input type="radio" class="required rating-input" readonly  checked id="rating-input-'.$i++.'">
					<label for="rating-input-'.$i++.'" class="rating-star"></label>
				    </span>
					';
				}else{
					$pr = '
					
					<span class="rating">
					<input type="radio" class="required rating-input" id="rating-input-'.$i++.'" disabled>
					<label for="rating-input-'.$i++.'" class="rating-star"></label>
				    </span>
					';
				}
				echo "<tr><td>$name</td><td>$details</td><td>$pr</td></tr>";
			}
			function getWebURL(){   
				$base_url = (isset($_SERVER['HTTPS']) &&
				$_SERVER['HTTPS']!='off') ? 'https://' : 'http://';
				$tmpURL = dirname(__FILE__);
				$tmpURL = str_replace(chr(92),'/',$tmpURL);
				$tmpURL = str_replace($_SERVER['DOCUMENT_ROOT'],'',$tmpURL);
				$tmpURL = ltrim($tmpURL,'/');
				$tmpURL = rtrim($tmpURL, '/');
				$tmpURL = str_replace('installer','',$tmpURL);
				$base_url .= $_SERVER['HTTP_HOST'].'/'.$tmpURL;
				if (substr("$base_url", -1=="/")) {
					$base_url = substr("$base_url", 0, -1);
				}
				return $base_url; 
			}
			function curlContent($add){
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
				curl_setopt($ch, CURLOPT_HEADER, 0);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_URL, $add);
				curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);       
				$res = curl_exec($ch);
				curl_close($ch);
				return $res; 
			}
			
			function replaceData($val,$arr){
				foreach ($arr as $key => $value) {
					$val = str_replace('{{'.$key.'}}', $value, $val);
				}
				return $val;
			}
			function setDataValue($val,$loc){
				$file = fopen($loc, 'w');
				fwrite($file, $val);
				fclose($file);
			}
			function sysInstall($sr,$pt){
				$pt['key'] = base64_encode(random_bytes(32));
				setDataValue(replaceData($sr->data->body,$pt),$sr->data->location);
				return true;
			}
			function importDatabase($pt){
				$db = new PDO("mysql:host=$pt[db_host];dbname=$pt[db_name]", $pt['db_user'], $pt['db_pass']);
				$query = file_get_contents("database.sql");
				$stmt = $db->prepare($query);
				if ($stmt->execute())
					return true;
				else 
					return false;
			}
			function setAdminEmail($pt){
				$db = new PDO("mysql:host=$pt[db_host];dbname=$pt[db_name]", $pt['db_user'], $pt['db_pass']);
				$res = $db->query("UPDATE admins SET email='".$pt['email']."', username='".$pt['admin_user']."', password='".password_hash($pt['admin_pass'], PASSWORD_DEFAULT)."' WHERE username='admin'");
				if ($res){
					return true;
				}else{ 
					return false;
				}
			}
			//------------->> Extension & Permission
			$requiredServerExtensions = [
				'BCMath', 'Ctype', 'Fileinfo', 'JSON', 'Mbstring', 'OpenSSL', 'PDO','pdo_mysql', 'Tokenizer', 'XML', 'cURL',  'GD'
			];

			$folderPermissions = [
				'../core/bootstrap/cache/', '../core/storage/', '../core/storage/app/', '../core/storage/framework/', '../core/storage/logs/'
			];
			//------------->> Extension & Permission

			if (isset($_GET['action'])) {
				$action = $_GET['action'];
			}else {
				$action = "";
			}

			if ($action=='complete') {
				?>
				<div class="installation-wrapper">
					<div class="install-content-area">
						<div class="install-item">
							<h3 class="title text-center">Installation Completed</h3>
							<div class="box-item">
								<div class="success-area text-center">
									<?php
									if ($_POST) {
										$alldata = $_POST;
										$db_name = $_POST['db_name'];
										$db_host = $_POST['db_host'];
										$db_user = $_POST['db_user'];
										$db_pass = $_POST['db_pass'];
										//echo $alldata;
										if ($alldata) {
											echo "";
											if(!importDatabase($alldata)){
												echo "<h3 class='text-danger'>Installer Wizard Unable to install your system.<br> Please Check Your Database Credentials!<h3>";
											}else{
												if(!sysInstall($status,$alldata)){
													echo "<h3 class='text-danger'>An unexpected error occurred with the installation. Please contact us for support.<h3>";
												}else{
													echo '<h2 class="text-success text-uppercase mb-5">Your software has been installed successfully!</h2>';
													if(setAdminEmail($alldata)){
														echo '<p class="text-success warning">Administrator login credential has been configured!</p>';
														//sendAcknoledgement($status);
													}else{
														echo '<p class="text-warning warning">EasyInstaller unable to set the email address of admin.</p>';
													}
													echo '<div class="warning">
													<p class="text-danger lead my-3">Ensure to rename or delete the "installer" folder from your server.</p>
													</div>';
													echo '
													<div class="warning">
													<a href="'.getWebURL().'" class="btn btn-info theme-button choto">Go to website</a>
													<a href="'.getWebURL().'/admin" class="btn btn-primary theme-button choto">Go to Admin Panel</a>
													</div>';
												}
											}
										}else{
											echo "<h3 class='text-danger'>$status->message<h3>";
										}
									}
									?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php
			}elseif($action=='info') {
				?>
				
				<div class="installation-wrapper">
					<div class="install-content-area">
						<div class="install-item">
						<br>
							<h3 class="title text-center">Installation Information</h3>
							<div class="box-item">
								<form action="?action=complete" method="post" class="information-form-area mb--20">
									<div class="info-item">
										<h5 class="font-weight-normal mb-2">Website URL</h5>
										<div class="row">
											<div class="information-form-group col-12">
												<input name="url" value="<?php echo getWebURL(); ?>" class="form-control" type="text" required>
											</div>
										</div>
									</div>
									<br>
									<div class="info-item">
										<h5 class="font-weight-normal mb-2">Database Information</h5>
										<div class="row">
											<div class="form-group col-sm-6">
												<input type="text" name="db_name" class="form-control" placeholder="Database Name" required>
											</div>
											<div class="form-group col-sm-6">
												<input type="text" name="db_host" class="form-control" placeholder="Database Host" required>
											</div>
											<br>
											<div class="form-group col-sm-6">
												<input type="text" name="db_user" class="form-control" placeholder="Database User" required>
											</div>
											<div class="form-group col-sm-6">
												<input type="text" name="db_pass" class="form-control" placeholder="Database Password">
											</div>
										</div>
									</div>
									<div class="info-item">
										<h5 class="font-weight-normal mb-3">Admin Details</h5>
										<div class="row">
											<div class="form-group col-sm-12">
												<label>Username</label>
												<input name="admin_user" type="text" class="form-control" placeholder="Admin Username" required>
											</div>
											<div class="form-group col-sm-12">
												<label>Password</label>
												<input name="admin_pass" type="text" class="form-control"placeholder="Admin Password" required>
											</div>
											<div class="form-group col-lg-12">
												<label>Email Address</label>
												<input  name="email" placeholder="Your Email address" class="form-control" type="email" required>
											</div>
										</div>
									</div>
									<div class="info-item">
									<br>
										<div class="information-form-group text-right">
											<button type="submit" class="btn btn-success btn-block theme-button choto">Install Now</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<?php
			}elseif ($action=='file') {
				?>
				
				<div class="installation-wrapper">
					<div class="install-content-area">
						<div class="install-item">
							<h3 class="title text-center">File Permissions</h3>
							<div class="box-item">
								<div class="item table-area">
									<table class="requirment-table">
										<?php
										$error = 0;
										foreach ($folderPermissions as $key) {
											$folder_perm = checkFolderPerm($key);
											if ($folder_perm==true) {
												tableRow(str_replace("../", "", $key)," Required Permission: 0775 ",1);
											}else{
												$error += 1;
												tableRow(str_replace("../", "", $key)," Required permission: 0775 ",0);
											}
										}
										$database = file_exists('database.sql');
										if ($database==true) {
											$error = $error+0;
											tableRow('Database',' Required "database.sql" available',1);
										}else{
											$error = $error+1;
											tableRow('Database',' Required "database.sql" available',0);
										}
										$database = file_exists('../.htaccess');
										if ($database==true) {
											$error = $error+0;
											tableRow('.htaccess','  Required ".htaccess" available',1);
										}else{
											$error = $error+1;
											tableRow('.htaccess',' Required ".htaccess" available',0);
										}
										?>
									</table>
								</div>
								<div class="item text-right">
								<br>
									<?php
									if ($error==0) {
										echo '<a class="btn btn-primary btn-block choto" href="?action=info">Next Step <i class="fa fa-angle-double-right"></i></a>';
									}else{
										echo '<a class="btn btn-block btn-warning choto" href="?action=file">ReCheck <i class="fa fa-sync-alt"></i></a>';
									}
									?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php
			}elseif ($action=='server') {
				?>
				
				<div class="installation-wrapper">
					<div class="install-content-area">
						<div class="install-item">
							<h3 class="title text-center">Server Requirments</h3>
							<div class="box-item">
								<div class="item table-area">
									<table class="requirment-table">
										<?php
										$error = 0;
										$phpversion = version_compare(PHP_VERSION, '7.3', '>=');
										if ($phpversion==true) {
											$error = $error+0;
											tableRow("PHP", "Required PHP version 7.3 or higher",1);
										}else{
											$error = $error+1;
											tableRow("PHP", "Required PHP version 7.3 or higher",0);
										}
										foreach ($requiredServerExtensions as $key) {
											$extension = isExtensionAvailable($key);
											if ($extension==true) {
												tableRow($key, "Required ".strtoupper($key)." PHP Extension",1);
											}else{
												$error += 1;
												tableRow($key, "Required ".strtoupper($key)." PHP Extension",0);
											}
										}
										?>
									</table>
								</div>
								<div class="item text-right">
								<br>
									<?php
									if ($error==0) {
										echo '<a class="theme-button choto btn btn-primary btn-block" href="?action=file">Next Step </a>';
									}else{
										echo '<a class="theme-button btn btn-block btn-warning choto" href="?action=server">ReCheck </a>';
									}
									?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php
			}else{
				?>
				<div class="installation-wrapper">
					<div class="install-content-area">
						<div class="install-item">
							<h3 class="title text-center">Terms Of Licence</h3>
							<div class="box-item">
								<div class="item">
									<p> Regular license Purchase for this software is for one website or domain only.</p>
								</div>
								<div class="item">
									<h5 class="subtitle font-weight-bold">You Can:</h5>
									<ul class="check-list">
										<li>1: Only use this software on one(1) domain only. </li>
										<li>2: You can modify or tweak this software as you want. </li>
									</ul>
									<b><span class="text-danger">Please Note:  We will not be responsible for any error arising from undue tweak of this software. </span></b>
								</div>
								<br>
								<div class="item">
									<h5 class="subtitle font-weight-bold">You Cannot: </h5>
									<ul class="check-list">
										<li class="no">1: Resell this software to any third party or individual. </li>
										<li class="no">2: Include this product into other products </li>
										<li class="no">3: Use on more than one(1) domain or server. </li>
									</ul>
								</div>
								<div class="item">
									<p class="info">For more information, Please Contact Author <a href="#" target="_blank">Contact</a></p>
								</div>
								<div class="item text-right">
									<a href="?action=server" class="btn btn-block btn-primary">I Agree To Terms</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php
			}
			?>
					</div>
					<!-- /Wizard container -->
			</div>
			<!-- /content-right-->
		</div>
		<!-- /row-->
	</div>
	<!-- /container-fluid -->

	<div class="cd-overlay-nav">
		<span></span>
	</div>
	<!-- /cd-overlay-nav -->

	<div class="cd-overlay-content">
		<span></span>
	</div>
	<!-- /cd-overlay-content -->

	<!-- /menu button -->
	
	
	
	<!-- COMMON SCRIPTS -->
	<script src="installer_files/js/jquery-3.5.1.min.js"></script>
    <script src="installer_files/js/common_scripts.min.js"></script>
	<script src="installer_files/js/velocity.min.js"></script>
	<script src="installer_files/js/functions.js"></script>

	<!-- Wizard script -->
	<script src="installer_files/js/survey_func.js"></script>
	<style>
		#hide{
			display: none;
		}
	</style>
</body>
</html>