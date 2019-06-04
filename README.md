# APP

Aplicación que simula 2 enfoques de una tienda online 

* El administrador 

* Los usuarios regulares (clientes) 

## Iniciar APP

Versión de ruby necesaria 

``` 
ruby –v # ruby 2.6.3p62 
``` 

Una vez que estemos dentro de la aplicación por medio de la terminal ejecutar el siguiente comando para instalar las gemas necesarias:  

``` 
bundle install && bundle update  
``` 

Crear la base de datos a través del comando: 

``` 
rake db:migrate 
``` 

Cargamos datos para ver el funcionamiento de la aplicación:  

``` 
rake db:seed 
``` 

Finalmente iniciamos la aplicación: 

``` 
rails s 
``` 

### Uso de la aplicación con el rol de Administrador 

* Ir a localhost:3000 

* Iniciar sesión con: 

  * Email: admin@gmail.com 

   * Contraseña: password123 

* Muestra la pantalla Facturas  

**NOTA:** Su pantalla de inicio se refrescara en caso de que se agregue una factura nueva o actualice el estado de alguna. 

### Uso de la aplicación con el rol de Cliente

* Ir a localhost:3000 

* Iniciar sesión con: 

   * Email: usuario_1@gmail.com

   * Contraseña: password123 

* Muestra el index de Productos 

* Puede ver por separado cada producto y agregarlos a su carrito de compras 

* Puede ver su carrito de compras y pagarlo de 2 maneras diferentes 


## SPEI 

Requiere número de tarjeta de 16 dígitos 

Código de la tarjeta de 3 dígitos 

## Ventanilla 

El pago por ventanilla crea una fecha aleatoria de pago y su multa correspondiente 

En la vida real un pago por ventanilla tarda 1 día en ser reflejado pero para fines ilustrativos de la aplicación el pago por ventanilla se demora 1 minuto.

**Nota:**
Para cambiar esto ir al archivo 

```
app/controllers/purchases_controller.rb
```

y buscar la linea 64:
```
InvoiceJobJob.set(wait: 1.minute).perform_later(invoice.id)
```
## Pruebas

Se utilizo Rspec y capybara para realizar las pruebas

Ejecutar comando:

```
rspec
```
