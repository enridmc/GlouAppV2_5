# Contexto del proyecto Glourant

## Idea general

Glourant es una plataforma digital para restaurantes pensada para modernizar la experiencia del cliente y mejorar la gestion interna del local. El objetivo es centralizar en una misma solucion los pedidos digitales desde mesa, la carta, las comandas, la cocina, las reservas, los pagos y la administracion del restaurante.

El primer objetivo no es construir todo el producto final, sino una demo funcional y presentable que pueda probarse en vivo en un local real. La demo debe validar el flujo principal:

```text
Cliente escanea QR
-> abre sesion de mesa
-> ve carta
-> anade productos al carrito
-> envia pedido
-> el restaurante ve la comanda
-> cocina recibe el pedido
-> cocina cambia el estado
-> el cliente ve la actualizacion
-> se simula pago o cierre manual
-> la mesa queda libre
```

## Problema que resuelve

Muchos restaurantes trabajan con procesos separados: reservas por telefono o plataformas externas, comandas en papel, cartas fisicas o PDFs, cocina con poca visibilidad del estado real de los pedidos, pagos poco integrados y dificultad para saber en tiempo real que ocurre en cada mesa.

Glourant busca conectar esos procesos y empezar por el flujo mas importante para una demo real:

```text
mesa -> QR -> pedido -> cocina -> servicio -> pago/cierre
```

## Objetivo funcional inicial

La primera version debe permitir que un cliente use el sistema sin registro obligatorio. El cliente escanea el QR de una mesa y se crea o reutiliza una sesion temporal asociada a esa mesa.

Desde esa sesion el cliente debe poder:

- consultar la carta digital;
- ver categorias, platos, variantes y extras;
- anadir productos al carrito;
- enviar un pedido;
- ver el estado del pedido;
- pedir la cuenta o llegar a un cierre simulado.

El restaurante debe poder:

- ver el estado de las mesas;
- identificar mesas libres, ocupadas, reservadas o bloqueadas;
- ver sesiones activas de mesa;
- recibir comandas;
- enviar o visualizar pedidos en cocina;
- cambiar estados de preparacion;
- cerrar la mesa y liberarla.

## Modulos de la demo

Para mantener el foco, la demo inicial debe centrarse en estos modulos:

- Login o acceso basico del restaurante.
- Dashboard inicial.
- Panel de mesas.
- Carta digital.
- Flujo QR de cliente.
- Sesion de mesa.
- Carrito.
- Pedido/comanda.
- Vista de cocina.
- Estado del pedido.
- Cierre manual de mesa o pago simulado.

Reservas completas, pagos reales, stock avanzado, caja, facturacion, analitica y notificaciones complejas quedan para fases posteriores.

## Arquitectura prevista

La arquitectura final se plantea con tres sistemas de datos, cada uno con una responsabilidad distinta.

### MySQL

MySQL sera la base principal y la fuente de verdad. Guardara los datos importantes y transaccionales:

- usuarios;
- restaurantes;
- locales;
- mesas;
- reservas;
- carta maestra;
- comandas;
- pagos;
- facturas;
- stock;
- caja;
- auditoria.

### Firebase Firestore

Firestore se usara mas adelante para sincronizacion en tiempo real:

- estado vivo de mesas;
- pedidos activos;
- cocina;
- notificaciones;
- sesiones activas;
- actualizaciones instantaneas para sala y cocina.

### MongoDB

MongoDB se usara mas adelante para documentos flexibles y lecturas rapidas:

- cartas publicadas;
- snapshots de pedidos;
- historico de actividad;
- analitica;
- documentos preparados para lectura rapida.

## Arquitectura de la primera fase

Para avanzar rapido, la primera fase usara solo:

```text
Flutter Web + API Backend + MySQL
```

Regla importante: Flutter no debe conectarse directamente a MySQL. La app siempre debe comunicarse con una API backend, y la API sera la responsable de leer y escribir en la base de datos.

## Tecnologia de la app

La app se desarrollara en Flutter, empezando por Flutter Web, con diseno responsive/adaptativo desde el inicio.

El objetivo es que el mismo proyecto pueda evolucionar a:

- web para administracion;
- tablet para sala/cocina;
- movil para cliente;
- Android;
- iOS.

El desarrollo se hara desde Visual Studio Code y el proyecto se versionara con Git.

## Fases de desarrollo

### Fase 1: Prototipo visual

Crear la app Flutter con pantallas basicas y datos mock:

- login;
- dashboard;
- mesas;
- carta;
- pedido QR;
- carrito;
- cocina;
- estado del pedido.

### Fase 2: Conexion con backend

Crear una API que conecte Flutter con MySQL.

La app no debe acceder directamente a la base de datos.

### Fase 3: Demo funcional

Conseguir que el flujo completo funcione con datos reales en MySQL:

- sesion de mesa;
- carta;
- carrito;
- pedido;
- comanda;
- cocina;
- cambio de estados;
- cierre de mesa.

### Fase 4: Tiempo real

Anadir Firestore para sincronizar en vivo:

- mesas;
- cocina;
- pedidos;
- sesiones activas;
- notificaciones.

### Fase 5: Escalado del producto

Anadir capacidades avanzadas:

- MongoDB;
- pagos reales;
- stock avanzado;
- reservas completas;
- facturacion;
- caja;
- analitica;
- app movil final.

## Prioridad actual

La prioridad actual es construir una demo solida y presentable, no cerrar desde el principio toda la arquitectura definitiva.

El foco inmediato debe estar en:

- flujo QR;
- sesion de mesa;
- carta;
- carrito;
- comanda;
- cocina;
- cambio de estados;
- cierre de mesa;
- panel basico del restaurante.

## Vision final

La vision final de Glourant es convertirse en una plataforma integral para restaurantes, donde el cliente pueda interactuar de forma digital y comoda desde su mesa, y el restaurante pueda gestionar mejor su operativa diaria con informacion centralizada, automatizacion y datos en tiempo real.

El producto debe ser util tanto para pequenos restaurantes que quieran digitalizar carta y pedidos como para locales mas avanzados que necesiten reservas, cocina, stock, pagos, caja y analitica.

## Criterio de trabajo

Cuando se retome el proyecto desde otro chat, equipo o sesion, este archivo debe leerse primero para mantener el foco. Antes de cada commit importante conviene actualizar este documento o generar un backup en Markdown con:

- estado actual del proyecto;
- cambios realizados;
- decisiones tomadas;
- pendientes;
- proximos pasos;
- comandos utiles.
