<?php
	if (secCheckMethod('POST')) {
		$post = secGetInputArray(INPUT_POST);
		
		$error = [];

		if (!secValidateToken($post['_once'], 600)) {
			$error['session'] = 'Din session er udløbet. Prøv igen.';
		}

		if(isset($post['opretBruger'])){
			$fornavn     = validCharacter($post['fornavn']) ? $post['fornavn']           : $error['fornavn']     = 'Fejl i fornavn';
			$efternavn   = validCharacter($post['efternavn']) ? $post['efternavn']       : $error['efternavn']   = 'Fejl i efternavn';
			$fodselsdato = validDate($post['fodselsdato']) ? $post['fodselsdato']        : $error['fodselsdato'] = 'Fejl i fødselsdato';
			$adresse     = validStringBetween($post['adresse'], 2, 65) ? $post['adresse']: $error['adresse']     = 'Fejl i adresse';
			$postnr      = validIntBetween($post['postnr'], 4, 5) ? $post['postnr']      : $error['postnr']      = 'Fejl i postnr';
			$by          = validCharacter($post['city'], 2, 31) ? $post['city']          : $error['city']        = 'Fejl i by';
			$tel         = validTel($post['tlf']) ? $post['tlf']                         : $error['tlf']         = 'Fejl i tlf';
			$mail        = validEmail($post['email']) ? $post['email']                   : $error['email']       = 'Fejl i email';
			$adgangskode = validMatch($post['gentagKode'], $post['kode']) ? $post['kode']: $error['kode']        = 'Fejl i kode';
			
			if(sizeof($error) > 0){
				//echo '<pre>',print_r($error),'</pre>';
				foreach ($error as $message) {
					@$msg .= '<div class="danger"><p>'.$message.'</p></div>'.PHP_EOL;
				}
			} else {
				// good job
			}
		}
		
	}
?>

<form action="" method="post">
	<?=secCreateTokenInput()?>
	<?=@$msg?>
	<fieldset>
		<legend>Profil:</legend>
		<label for="fornavn">Fornavn</label><br />
		<input type="text" min="2" max="30" name="fornavn" id="fornavn"><br />
		<label for="efternavn">Efternavn</label><br />
		<input type="text" min="2" max="30" name="efternavn" id="efternavn"><br />
		<label for="fodselsdato">Fødselsdato</label><br />
		<input type="date" name="fodselsdato" id="fodselsdato"><br />
		<label for="adresse">Adresse</label><br />
		<input type="text" min="2" max="65" name="adresse" id="adresse"><br />
		<label for="postnr">Post nr.</label><br />
		<input type="number" min="0" max="99999" name="postnr" id="postnr"><br />
		<label for="city">By</label><br />
		<input type="text" min="2" max="31" name="city" id="city"><br />
		<label for="tlf">Tlf.</label><br />
		<input type="tel" name="tlf" min="8" max="8" id="tlf">
	</fieldset>
	<fieldset>
		<legend>Login oplysninger:</legend>
		<label for="email">E-mail</label><br />
		<input type="email" id="email" name="email"><br />
		<label for="kode">Adgangskode</label><br />
		<input type="password" name="kode" id="kode"><br />
		<label for="gentagKode">Gentag adgangskode</label><br />
		<input type="password" name="gentagKode" id="gentagKode"><br />
		<button type="submit" name="opretBruger">Opret</button>
	</fieldset>
</form>