<!DOCTYPE html>
<html lang="pt">
   <head>
      <meta charset="UTF-8">
      
      <title>Ranking Obelus</title>
      
      <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
      <link rel="stylesheet" type="text/css" href="style.css" media="all">
   </head>

   <body>

      <div id="wrapper">
      
         <div id="topo01"></div>
         <div id="topo02"></div>
         <div id="topo03"></div>
         <div id="topo04"></div>
         <div id="topo05"></div>   

         <div id="header">
            <h1>Ranking Obelus</h1>
         </div>

         <div id="conteudo">
            <table>
               <tr>
                  <td>Posição</td>

                  <td>Nome</td>
                  <td>Pontos</td>
                  <td>Streak</td>
               </tr>
               <?php 
                  $nome = $_GET['nome']; //Colocar o $GEt
                  $pontos = $_GET['pontos'];
                  $streak = $_GET['streak'];

                  if($nome != NULL && $pontos != NULL) 
                  {
                     $cmdInsert = "INSERT INTO `ranking` (`nome`,`pontos`,`streak`) VALUES ('".$nome."', ".$pontos.", ".$streak.")";
                     echo 'Linhas afetadas: ' . insertMySQL($cmdInsert);
                  }else{
                     ranking();
                     echo 'Não colocou nada';
                  }

               ?>
               <tr>
                  <td>1</td>
                  <td>Humberto</td>
                  <td>98283</td>
                  <td>29</td>
               </tr>               
            </table>
         </div>

         <div id="footer">
            <h5>Todos direitos liberados - <a href="http://www.betovieira.url.ph/obelus" id="inova" target="_blank" ><strong>Obelus Games®</strong></a></h5>
         </div>
      
      </div>
         
   </body>
</html>


<?php 

function insertMySQL($query)
{
   include 'config.php';

   $result = mysql_query($query) or die ("Erro na inserção : " . mysql_error());

   mysql_close($conexao);
   
   return $result;
}

function ranking()
{
   include 'config.php';

   $result = mysql_query("SELECT `nome`,`pontos`,`streak` FROM `ranking` ORDER BY pontos DESC") 
               or die ("A consulta falhou: ". mysql_error());
   $cont = 1;
   while($row = mysql_fetch_array($result, MYSQL_ASSOC))
   {
      echo '<tr>';
      echo      '<td>'. $cont .'</td>';
      echo      '<td>'. $row[0].'</td>';
      echo      '<td>'. $row[1].'</td>';
      echo      '<td>Não tem ainda</td>';
      echo '</tr>';
      $cont++;
   }  

   echo '</ol>';
   mysql_close($conexao);
}

?>