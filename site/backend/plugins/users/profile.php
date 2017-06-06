<?php
    if(!secIsLoggedIn()) {
        header ('Location: ?side=logind');
        die();
    }
    
    //print_r($_SESSION);


    /**
    * Ændrer oplysningerne der displayes på din profil
    *
    * @UPDATE profil
    *
    */

    $stmt = $conn->prepare("SELECT profil.ID, fornavn, efternavn, fodselsdato, adresse, postnr, city, tlf FROM profil
                            INNER JOIN Brugere ON profil.ID = brugere.fk_profil WHERE brugere.ID = :id"); 
    $stmt->bindParam(':id', $_SESSION['userid'], PDO::PARAM_INT);
    $stmt->execute();
    ?>
<fieldset>
    <legend>Profiloplysninger:</legend>
    <?php
    
    $result = $stmt->fetch(PDO::FETCH_OBJ);
    
    ?>
    <form method="post">
            <label for="RettetFornavn">Fornavn</label><br />
            <input type="text" min="2" max="30" name="RettetFornavn" id="RettetFornavn" value="<?=$result->fornavn?>"><br /><br />

            <label for="RettetEfternavn">Efternavn</label><br />
            <input type="text" min="2" max="30" name="RettetEfternavn" id="RettetEfternavn" value="<?=$result->efternavn?>"><br /><br />

            <label for="RettetFodselsdato">Fødselsdato</label><br />
            <input type="text" min="2" max="30" name="RettetFodselsdato" id="RettetFodselsdato" value="<?=$result->fodselsdato?>"><br /><br />

            <label for="RettetAdresse">Adresse</label><br />
            <input type="text" min="2" max="30" name="RettetAdresse" id="RettetAdresse" value="<?=$result->adresse?>"><br /><br />

            <label for="RettetPostnr">Postnummer</label><br />
            <input type="text" min="2" max="30" name="RettetPostnr" id="RettetPostnr" value="<?=$result->postnr?>"><br /><br />

            <label for="RettetCity">By</label><br />
            <input type="text" min="2" max="30" name="RettetCity" id="RettetCity" value="<?=$result->city?>"><br /><br />

            <label for="RettetTlf">Telefon</label><br />
            <input type="text" min="2" max="30" name="RettetTlf" id="RettetTlf" value="<?=$result->tlf?>"><br /><br />

            <button type="submit" name="redigerBrugerProfil">Opdater Oplysninger</button>
    </form>
</fieldset>

<?php
    
    if(isset($_POST['redigerBrugerProfil'])){
		$RettetFornavn        = $_POST['RettetFornavn'];
		$RettetEfternavn      = $_POST['RettetEfternavn'];
		$RettetFodselsdato    = $_POST['RettetFodselsdato'];
		$RettetAdresse        = $_POST['RettetAdresse'];
        $RettetPostnr         = $_POST['RettetPostnr'];
		$RettetCity           = $_POST['RettetCity'];
		$RettetTlf            = $_POST['RettetTlf'];

		$sql = "UPDATE profil SET fornavn='$RettetFornavn', efternavn='$RettetEfternavn', fodselsdato='$RettetFodselsdato', adresse='$RettetAdresse', postnr='$RettetPostnr', city='$RettetCity', tlf='$RettetTlf' WHERE profil.ID =" . $_SESSION['userid'];
		$conn->query($sql);
        echo '<h3>Dine oplysninger er blevet opdateret! Tryk F5 for at reloade siden og se dine opdaterede oplysninger!</h3>';
	}
    
    /**
    * Ændrer oplysningerne der bruges til at logge ind med
    *
    * @UPDATE brugere
    *
    */

    $stmt = $conn->prepare("SELECT brugere.ID, email, adgangskode FROM brugere WHERE brugere.ID =" . $_SESSION['userid']); 
    $stmt->execute();

?>

<fieldset>
    <legend>Loginoplysninger:</legend>
    
    <?php
    
        $result = $stmt->fetch(PDO::FETCH_OBJ);
    ?>
    <form method="post">
            <label for="fornavn">E-Mail</label><br />
            <input type="text" min="2" max="30" name="RettetEmail" id="RettetEmail" value="<?=$result->email?>"><br /><br />

            <label for="efternavn">Nuværende / Gammelt Kodeord</label><br />
            <input type="password" min="2" max="30" name="RettetAdgangskode" id="RettetAdgangskode" value=""><br /><br />
        
            <label for="efternavn">Nyt Kodeord</label><br />
            <input type="password" min="2" max="30" name="RettetNyAdgangskode" id="RettetNyadgangskode" value=""><br /><br />
        
            <label for="efternavn">Gentag Nyt Kodeord</label><br />
            <input type="password" min="2" max="30" name="RettetGentagNyAdgangskode" id="RettetGentagNyAdgangskode" value=""><br /><br />

            <button type="submit" name="redigerBrugerLogin">Opdater Oplysninger</button>
    </form>
</fieldset>
<br />

<?php
    $error = [];
    if(isset($_POST['redigerBrugerLogin'])) {
        $RettetEmail = $_POST['RettetEmail'];
        
        $sql = "UPDATE brugere SET email='$RettetEmail' WHERE brugere.ID =" . $_SESSION['userid'];
        $conn->query($sql);
        echo '<h3>Dine loginoplysninger er blevet opdateret! Tryk F5 for at reloade siden, log ind igen og se dine opdaterede loginoplysninger!</h3>';
        
        $post = secGetInputArray(INPUT_POST);
        if(!password_verify($post['RettetAdgangskode'], $result->adgangskode)) {
            $error['adgangskode'] = 'Forkert adgangskode';
        }
        $adgangskode = validMixedBetween($post['RettetNyAdgangskode'], 4) ? $post['RettetNyAdgangskode']                            : $error['kodematch']   = 'Fejl i kode';
        $adgangskode = validMatch($post['RettetGentagNyAdgangskode'], $post['RettetNyAdgangskode']) ? $post['RettetNyAdgangskode']  : $error['kodematch']   = 'Ny kode stemmer ikke overens';
        
        if(sizeof($error) === 0){
            $adgangskode = password_hash($adgangskode, PASSWORD_BCRYPT, ['cost' => 12]);
            $sql = "UPDATE brugere SET adgangskode = :adgangskode WHERE brugere.ID = :id";
            sqlQueryPrepared($sql, array(
                ':adgangskode' => $adgangskode,
                ':id' => $_SESSION['userid']
            ));
        }
    }
?>
