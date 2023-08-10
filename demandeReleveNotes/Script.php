<?php 
require '../emploi/connection.php';

$json_str = file_get_contents('php://input');

// $json_str ='{
// 				"nom":"Meknassi",
// 				"prenom":"Mohammed Cherkaoui",
// 				"dateNaissance":"2018-05-23",
// 				"email":"elaissaoui007@gmail.com",
// 				"cin":"A11111",
// 				"telephone":"0600567551",
// 				"adresse":"AVENUE MOHAMMED 5, IMM D43, N 5",
// 				"identiteDemandeur":"tuteur",
// 				"dateDemande":"2020-07-06",
// 				"estRecupere":0,
// 				"liste_releves":[
// 									{"anne":2009,"niveau":"1A","filiere":"A","groupe":"A","estAnneeComplete":1},
// 									{"anne":2009,"niveau":"1A","filiere":"B","groupe":"B","estAnneeComplete":1}
// 						     	]
// 			}';

$data = json_decode($json_str, true);


$stmt = $pdo->prepare("INSERT INTO demandeurs_releves_notes (nom, prenom, dateNaissance, email, cin, telephone, adresse, identiteDemandeur) VALUES (:nom, :prenom, :dateNaissance, :email, :cin, :telephone, :adresse, :identiteDemandeur)");
    $stmt->bindParam(':nom', $data['nom']);
    $stmt->bindParam(':prenom', $data['prenom']);
    $stmt->bindParam(':dateNaissance', $data['dateNaissance']);
    $stmt->bindParam(':email', $data['email']);
    $stmt->bindParam(':cin', $data['cin']);
    $stmt->bindParam(':telephone', $data['telephone']);
    $stmt->bindParam(':adresse', $data['adresse']);
    $stmt->bindParam(':identiteDemandeur', $data['identiteDemandeur']);

$stmt->execute();
    
$idDemandeur = $pdo->lastInsertId();

mail($data['email'],'Demande de retrait du relevé de notes', 'M./Mme ' . $data['nom'] . ', votre demande de retrait du relevé de notes est enregistrée sous numéro ' . $idDemandeur . ' vous pouvez la récupérer à l’établissement à partir du ………..');

    foreach ($data['liste_releves'] as $key => $value) {
            $stmt = $pdo->prepare("INSERT INTO liste_releves_notes (anne, niveau, filiere, groupe, estAnneeComplete, idDemandeur) VALUES (:anne, :niveau, :filiere, :groupe, :estAnneeComplete, $idDemandeur)");
            $stmt->bindParam(':anne', $value['anne']);
            $stmt->bindParam(':niveau', $value['niveau']);
            $stmt->bindParam(':filiere', $value['filiere']);
            $stmt->bindParam(':groupe', $value['groupe']);
            $stmt->bindParam(':estAnneeComplete', $value['estAnneeComplete']);
            
           
            $stmt->execute();
        }

echo $idDemandeur;
?>

