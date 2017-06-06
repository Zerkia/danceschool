<?php
    if(secCheckLevel() < 90){
        echo '<h3>Du har ikke privilegier til at se denne side.</h3>';
		die();
	}

	if(secCheckLevel() > 90){
		$options = [
			'class' => 'striped responsive-table',
			'actions' => [
				'selector' => 'ID',
				'edit' => 'index.php?side=editUser&ID=',
				'delete' => 'index.php?side=deleteUser&ID=',
				'create' => 'index.php?side=opretBruger'
			]
		];
	} else {
		$options = [
			'class' => 'striped responsive-table',
			'actions' => [
				'selector' => 'ID',
				'edit' => 'index.php?side=editUser&id='
			]
		];
	}
	echo buildTable(
		['Dato','Fornavn', 'Efternavn', 'Rolle', 'ID'], 
		sqlQueryAssoc('SELECT profil.oprettet, profil.fornavn, profil.efternavn, brugerroller.navn, brugere.ID FROM `brugere`
						INNER JOIN `brugerroller` ON `brugere`.`fk_brugerrolle` = `brugerroller`.`ID`
						INNER JOIN `profil` ON `profil`.`ID` = `brugere`.`fk_profil`'),
		$options
	);
?>