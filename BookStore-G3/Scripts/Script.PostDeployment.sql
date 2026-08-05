/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
:r .\Data\Script.PostDeployment.Author.sql

:r .\Data\Script.PostDeployment.Publisher.sql

:r .\Data\Script.PostDeployment.BookLanguage.sql

:r .\Data\Script.PostDeployment.Book.sql

:r .\Data\Script.PostDeployment.BookAuthor.sql

:r .\Data\Script.PostDeployment.ShippingMethod.sql

:r .\Data\Script.PostDeployment.OrderStatus.sql

:r .\Data\Script.PostDeployment.Country.sql

:r .\Data\Script.PostDeployment.AddressStatus.sql

:r .\Data\Script.PostDeployment.Customer.sql

:r .\Data\Script.PostDeployment.Address.sql

:r .\Data\Script.PostDeployment.CustomerAddress.sql

:r .\Data\Script.PostDeployment.CusOrder.sql

:r .\Data\Script.PostDeployment.OrderHistory.sql

:r .\Data\Script.PostDeployment.OrderLine.sql
