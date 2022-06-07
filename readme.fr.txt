*********************************************************************************************************************
* Objet : Kit d'int�gration du Module CMI pour le paiement en ligne												*
*																												 	*
* Version :  V1.4.4.1 de janvier 2020																					*
*																													* 
* Copyright (c) 2020 Centre Mon�tique Interbancaire (CMI). Tous droits r�serv�s.											*
*********************************************************************************************************************



Pr�sentation :
--------------
Ce kit vous permet d'int�grer, sur votre site marchand, le module du paiement en ligne du Centre Mon�tique Interbancaire (CMI).


Contenu :
---------
Ce kit contient les �lement suivants :
												===================================
																Doc
												===================================
	* /Docs/
	  Il s'agit de la documentation qui explique les techniques d'interfa�age avec la plate-forme ECOM CMI pour le paiement en ligne.
		
		
												===================================
																Script
												===================================											
	* /Scripts/
	  Il s'agit d'exemples de scripts en c#.net, jsp, php, vb.net qui pr�sentent les diff�rentes requ�tes �chang�es entre le site marchand et la plate-forme ECOM CMI pour le paiement en ligne.	  


												===================================
															Plugins CMS
												===================================
	  Le CMI dispose de plugins compatibles avec les CMS ci-dessous. L'utilisation de ces plugins permet une int�gration simple et rapide du module de paiement en ligne du CMI.
	  - Prestashop 1.6
	  - Prestashop 1.7
	  - WordPress WooCommerce
	  - WordPress Donation
	  - Joomla VirtueMart
	  - Magento 1.9
	  - Magento 2
	  - Drupal 8 Commerce
	  - Drupal 8 Ubercart
	  - OpenCart 3
	  - Shopify
	  - WHMCS
	  - Bundle Symfony 4

	
												===================================
																Charte
												===================================	 
	* /Charte/logos de s�curit� (obligatoires)/
	  Il s'agit de ressources graphiques obligatoires (logos) � mettre sur le site marchand afin d'assurer le client acheteur quant aux entit�s qui se chargent du traitement s�curis� des transactions en ligne.

	* /Charte/cgv/
	  Il s'agit d'un mod�le des Conditions G�n�rales de Vente (CGV) qui pr�sentent le contrat "virtuel" engageant les diff�rentes parties (Marchand et clients). 
	  Dans ce mod�le, les clauses m�tier sont � adapter par le marchand selon le contexte de son business. Quant aux clauses concernant le paiement (surlign�es avec une couleur diff�rente), elles sont � reprendre au niveau des CGV du site marchand.


												===================================
												 Guide d'Utilisation (back Office)
												===================================
	* (Voir le lien de t�l�chargement du guide dans l'email du kit d'int�gration que vous avez re�u)  
	  Il s'agit du document qui explique la proc�dure de gestion et d�administration des transactions en ligne au niveau de l'espace priv� (back office) octroy� aux marchands

												
	  
												===================================
														Tests de certification
												===================================
	* /TestsCertification/Cmi_eMerchant_Certification.xlsx
	  Vous �tes appel�s � r�aliser les tests d�crits dans ce fichier et retourner par email � l'�quipe Int�gration ECOM du CMI le fichier compl�t� par vos soins en pr�cisant le r�sultat de chaque test.

												
	  
Pr�-requis :
------------
Pour pouvoir exploiter ce kit, il est n�cessaire d'avoir re�u au pr�alable : 
	* les donn�es d'authentification (login/password) pour pouvoir t�l�charger les ressources n�cessaires
	* un num�ro de magasin de test
	* l'URL de la passerelle de test
	* les coordon�es d'une carte de paiement de test
	* un compte marchand d'acc�s au back office de suivi des transactions en ligne

	
Support :
---------
Pour plus d'informations, veuillez envoyer un courriel � integration.ecom@cmi.co.ma
