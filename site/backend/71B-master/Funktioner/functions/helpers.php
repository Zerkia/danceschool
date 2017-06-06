<?php
	function router($default = 'home', $errorSite = 'index.php?p=home'){
		if(isset($_GET['p'])){
			$page = __IncFolder__ . '/' . $_GET['p'] . '.php';
			if(file_exists($page)){
				include $page;
			} else {
				header('Location:'. $errorSite);
			}
		} else {
			header('Location:index.php?p=' . $default);
		}
	}

	function queryValidatorInt($param){
		if(isset($_GET[$param]) && is_numeric($_GET[$param])){
			return true;
		}
		return false;
	}

	function validateEmail($email, $online = false){
		if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
			if($online){
				$domain = explode('@', $email);
				if(filter_var(gethostbyname($domain[1]), FILTER_VALIDATE_IP))
				{
				    return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				return true;
			}
		}
		else
		{
			return false;
		}
	}