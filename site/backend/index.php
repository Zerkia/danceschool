<?php
	require_once './config.php';
	require_once '../lib/sqlOperations.php';
	require_once '../lib/helpers.php';
	require_once '../lib/validate.php';
	require_once '../lib/security.php';
	require_once '../lib/user.php';
	require_once '../lib/media.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<style>
		.main{
			margin-top: 15px;
		}
	</style>
</head>

<body>
	<div class="navbar-fixed">
		<nav class="teal z-depth-0">
			<div class="nav-wrapper container">
				<ul>
                    <?php
                        if(secIsLoggedIn() && secCheckLevel() >= 90){
                            echo '<li><a href="index.php?side=bruger">Brugere</a></li>';
                            echo '<li><a href="index.php?side=opretInstruktor">Opret instruktør</a></li>';
                        }
                    
                        if(!secIsLoggedIn()) {
                            echo '<li><a href="index.php?side=opretBruger">Opret Bruger</a></li>';
                            echo '<li><a href="index.php?side=logind">Log Ind</a></li>';
                        } else {
                            echo '<li><a href="index.php?side=profil">Profil</a></li>';
                        }
                    ?>
					<li class="right"><a class="dropdown-button" href="#!" data-activates="dropdown1"><i class="material-icons">account_circle</i></a></li>
				</ul>
				<ul id="dropdown1" class="dropdown-content">
                    <?php
                        if(!secIsLoggedIn()) {
                            echo '<li><a href="index.php?side=logind">Log Ind</a></li>';    
                        } else {
                            echo '<li><a href="index.php?side=profil">Profil</a></li>';
					        echo '<li class="divider"></li>';
                            echo '<li><a href="index.php?side=logud">Log ud</a></li>';
                        }
                    ?>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container main">
	<?php
		if (secCheckMethod('POST') || secCheckMethod('GET')) {
			$get = secGetInputArray(INPUT_GET);
			if (!secIsLoggedIn() && $get['side'] !== 'logind') {
				//header('Location: ?side=logind');
				//die();
			}
			if (isset($get['side']) && !empty($get['side'])) {
				switch ($get['side']) {
					case 'opretBruger':
						include_once './plugins/users/create.php';
						break;
					case 'bruger':
						include_once './plugins/users/list.php';
						break;
					case 'logind':
						include_once './plugins/users/login.php';
						break;
                    case 'logud':
                        include_once './plugins/users/logud.php';
                        break;
					case 'profil':
						include_once './plugins/users/profile.php';
						break;
					case 'opretInstruktor':
						include_once './plugins/instructor/create.php';
						break;
					default:
						echo '<h2>Velkommen til Landdrup Dans.</h2>'.PHP_EOL;
						break;
				}
			}
			else {
				echo '<h2>Velkommen til Landdrup Dans.</h2>'.PHP_EOL;
			}
		}
	?>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
	<script>
		$(document).ready(() => {
			$(".dropdown-button").dropdown({
				belowOrigin: true
			});
            $('select').material_select();
		});
	</script>
</body>

</html>