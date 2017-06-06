<?php
	if(secCheckLevel() < 90){
        echo '<h3>Du har ikke privilegier til at se denne side.</h3>';
		die();
	}
	if(secCheckMethod('POST')){
		$error   		= [];
		$post    		= secGetInputArray(INPUT_POST);
		$bruger 		= $post['bruger'] !== 0 ? $post['bruger'] 									: $error['bruger'] 		= 'fejl besked bruger!';
		$beskrivelse 	= validMixedBetween($post['beskrivelse'], 1, 511) ? $post['beskrivelse'] 	: $error['beskrivelse'] = 'fejl besked beskrivelse!';
		if(sizeof($error) === 0){
			$billede = mediaImageUploader('filUpload');
			if($billede['code']){
				sqlQueryPrepared(
					"
						INSERT INTO `media`(`sti`, `type`) VALUES (:sti, :type);
						SELECT LAST_INSERT_ID() INTO @lastId;
						INSERT INTO `instruktorer`(`beskrivelse`, `fk_media`, `fk_profil`) VALUES (:beskrivelse, @lastId, :fk_profil);
					",
					array(
						':sti' => $billede['name'],
						':type' => $billede['type'],
						':beskrivelse' => $beskrivelse,
						':fk_profil' => $bruger
					)
				);
			} else {
				$error['filUpload'] = $billede['msg'];
			}
		}
	} else {
			$stmt = $conn->prepare("SELECT brugere.ID, CONCAT(profil.fornavn, ' ', profil.efternavn) as navn FROM `brugere`
									INNER JOIN `brugerroller` ON `brugere`.`fk_brugerrolle` = `brugerroller`.`ID`
									INNER JOIN `profil` ON `profil`.`ID` = `brugere`.`fk_profil`
									WHERE `brugerroller`.niveau >= 50");
			$stmt->execute();
			$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
	}
?>
<form action="" method="post" enctype="multipart/form-data">
    <fieldset>
		<legend>Instruktører</legend>
        <div class="input-field col s12">
            <select name="bruger">
                <option value="0" disabled selected>Vælg en bruger</option>
                <?php for($i = 0; $i < count($result); $i++) { ?>
                    <option value="<?= $result[$i]['ID'] ?>"><?= $result[$i]['navn'] ?></option>
                <?php } ?>
            </select>
        </div><br />
        <label for="beskrivelse">Beskrivelse</label><br />
        <textarea name="beskrivelse" id="beskrivelse"></textarea><br />
        <label for="filUpload">Billede</label><br />
        <input name="filUpload" type="file"><br /><br />
        <button name="opretInstruktor" type="submit">Opret</button>
    </fieldset>
</form>