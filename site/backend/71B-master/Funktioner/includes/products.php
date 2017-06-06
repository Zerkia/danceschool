<?php
	if(queryValidatorInt('id')){
		echo 'produkt id';
	}

	if(validateEmail('test@gmail.com', true)){
		echo 'Godkendt email';
	} else {
		echo 'Forkert email';
	}