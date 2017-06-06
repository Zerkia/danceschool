<?php

/**
 * Tjekker request method
 *
 * @param string $method
 * @return boolean
 */
function secCheckMethod($method) {
	return (filter_input(INPUT_SERVER, 'REQUEST_METHOD', FILTER_SANITIZE_SPECIAL_CHARS) === strtoupper($method)) ? true : false;
}

/**
 * Returnér filtreret superglobal
 *
 * @param string $input
 * @return string
 */
function secGetInputArray($input) {
	return filter_input_array(strtoupper($input), FILTER_SANITIZE_SPECIAL_CHARS);
}

/**
 * Genererer et token, hvis der ikke i forvejen findes et
 *
 * @return void
 */
function secGenerateToken() {
	if (!isSessionStarted()) {
		session_start();
	}
	if (empty($_SESSION['Token'])) {
		if (function_exists('random_bytes')) {
			$_SESSION['Token'] = bin2hex(random_bytes(32));
		} elseif (function_exists('mcrypt_create_iv')) {
			$_SESSION['Token'] = bin2hex(mcrypt_create_iv(32, MCRYPT_DEV_URANDOM));
		} else {
			$_SESSION['Token'] = bin2hex(openssl_random_pseudo_bytes(32));
		}
		$_SESSION['TokenAge'] = time();
	}
}

/**
 * Opretter et skjult input-felt med navn _once og value token
 *
 * @return string html entity
 */
function secCreateTokenInput() {
	secGenerateToken();
	return '<input name="_once" type="hidden" value="'.$_SESSION['Token'].'">';
}

/**
 * Valider token og alder
 *
 * @param string $token
 * @param int $maxAge sekunder, default 300
 * @return boolean
 */
function secValidateToken($token, $maxAge = 300) {
	if (!isSessionStarted()) {
		session_start();
	}
	if ($token != $_SESSION['Token'] || (time() - $_SESSION['TokenAge']) > $maxAge) {
		return false;
	}
	else {
		unset($_SESSION['Token'], $_SESSION['TokenAge']);
		return true;
	}
}

/**
 * Tjekker om session er startet
 *
 * @return boolean
 */
function isSessionStarted() {
	if (php_sapi_name() !== 'cli') {
		if (version_compare(phpversion(), '5.4.0', '>=') ) {
			return session_status() === PHP_SESSION_ACTIVE ? true : false;
		} else {
			return session_id() === '' ? false : true;
		}
	}
	return true;
}