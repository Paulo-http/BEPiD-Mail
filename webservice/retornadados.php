<?php 
	$tipo_operacao = $_GET['tipo_operacao'];	
	
	try
	{
		//ESSA FUNCAO INSERE O USUARIO NO BANCO
		if($tipo_operacao == 1){
			$user = $_GET['user'];
			$senha = $_GET['senha'];
			$apelido = $_GET['apelido'];
			$email = $_GET['email'];
			$query = "INSERT INTO `usuario`(`id_usuario`, `user`, `senha`, `apelido`, `email`) VALUES (null,'". $user. "','". $senha ."','".$apelido."','". $email ."')";	
			echo updateMySQL($query);
		}
		//ESSA FUNCAO RETORNA A LISTA DE USUARIOS NO BANCO	
		else if($tipo_operacao == 2){
			$query = "SELECT * FROM `usuario`";
			echo selectMySQL($query);
		}
		//BUSCAR USUARIO POR PALAVRA
		else if($tipo_operacao == 3){
			$user = $_GET['user'];
			$query = "SELECT * FROM `usuario` WHERE `user` like '%" . $user. "%'";
			echo selectMySQL($query);
		}
		//INSERE/ENVIA EMAIL NO BANCO
		else if($tipo_operacao == 4){
			$id_usuario = $_GET['id_usuario'];
			$id_receptor = $_GET['id_receptor'];
			$para = $_GET['para'];
			$assunto = $_GET['assunto'];
			$texto = $_GET['texto'];
			$query = "INSERT INTO `email`(`id_email`, `id_usuario`, `id_receptor`, `assunto`, `texto`) VALUES (null,'".$id_usuario."','".$id_receptor."','".$assunto."','".$texto."')";
			

			echo updateMySQL($query);

			enviaEmail($para, $assunto, $texto);

		}


	}
	catch(Exception $e)
	{
		echo 'Valor nulo';
	}

?>

<?php 

	function selectMySQL($query)
	{
		include 'conectaBanco.php';

		
		$result = mysql_query($query) or die ('[{"retorno":"false"}]');

		$json_response = array();
		
		while($row = mysql_fetch_array($result,MYSQL_ASSOC))
			array_push($json_response, $row);
		
		mysql_close($con);
		
		return json_encode($json_response);
	}

	function updateMySQL($query)
	{
		include 'conectaBanco.php';

		//$result = mysql_query($query) or die ('[{"retorno":"false"}]');
		$result = mysql_query($query) or die (mysql_error());

		mysql_close($con);
		
		return '[{"retorno":"'.json_encode($result).'"}]';
	}

	function enviaEmail($para, $assunto, $texto) {
		$headers = 'Content-type: text/html; charset=iso-8859-1; From: Humberto e Paulo Enterprise <humbertovieira.castro@gmail.com>\n\n';
		
		$headers = "MIME-Version: 1.1\r\n";
		$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
		$headers .= "From: Paulo e Humberto Enterprises <paulo.humberto.enterprise.@gmail.com>\r\n"; 
		$headers .= "Return-Path: humbertovieira.castro@gmail.com\r\n"; 


		$texto = '<p>'. $texto .'</p>';

		if(mail($para, $assunto, $texto, $headers))
		{
			return true;
		} else {
			return false;
		}
	}
?>