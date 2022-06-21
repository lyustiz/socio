import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';

class CondicionesScreen extends StatelessWidget {
  const CondicionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: 'white',
      titleBar: AppTitleBarVariant(
        title: 'Terminos y Condiciones',
        leading: IconButton(
            onPressed: () => navigateTo(context, 'login'),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                //boxFit: BoxFit.cover,
                /* title: GFListTile(
                  avatar: GFAvatar(
                    backgroundColor: Colors.amber,
                    child: Icon(Icons.announcement_rounded,
                        color: Colors.white, size: 30),
                  ),
                  title: Text('JUEGOS JL'),
                  subTitle: Text('Terminos y Condiciones de Servicio'),
                ), */
                child: Text(
                  '''Tal como se utiliza en estos términos y condiciones, "nosotros" o "Amazon" significa Amazon Services LLC y "tú" significa la persona o entidad que compra los productos personalizados en Amazon.com. Cualquier persona o entidad que desee adquirir productos personalizados en Amazon.com debe aceptar estos términos y condiciones sin cambio alguno. AL DAR CLIC EN EL BOTÓN "AÑADIR AL CARRITO" Y HACER TU PEDIDO DE PRODUCTOS PERSONALIZADOS, ACEPTAS ESTAR COMPROMETIDO CON LOS TÉRMINOS Y CONDICIONES, EL AVISO DE PRIVACIDAD DE AMAZON.COM, LAS CONDICIONES DE USO Y TODAS SUS PAUTAS.
            
Personalización. Los productos personalizados que pidas serán impresos por terceros con quienes Amazon esté asociado para producir dichos productos. Podrás presentar tus propios materiales, incluyendo textos, fotografías, ilustraciones o gráficos y seleccionar de una galería de diseños para crear productos personalizados. Sólo puedes enviar material del cual poseas todos los derechos o debes contar con la autorización de la persona que sea titular de esos derechos.
            
Concesión de Licencia para los Materiales. Por este instrumento usted le otorga a Amazon y sus filiales el derecho y la licencia permanente, sin regalías, no exclusiva y en todo el mundo en relación con la producción de los productos personalizados que ordene para (a) reproducir, distribuir y mostrar los materiales que presente, incluyendo todas las marcas comerciales, nombres comerciales y nombres y semejanzas de las personas que aparezcan en sus materiales, (b) modificar y crear trabajos derivados de estos materiales y (c) sublicenciar los derechos anteriores a terceros que proporcionan los productos personalizados y servicios relacionados.
            
Pautas y Restricciones. Aceptas presentarnos los materiales de conformidad con todas las pautas de uso publicadas en el sitio web de Amazon o de las cuales se te notifiquen (“Pautas"). En particular, aceptas no presentar materiales que sean ilegales, pornográficos, difamatorios, ilícitos, obscenos, discriminatorios, o que de otro modo violen las normas generales de la comunidad de Amazon. Nos reservamos expresamente el derecho a retirar o no hacer disponible cualesquiera Materiales que consideremos se encuentren en violación de este Acuerdo, las leyes aplicables o nuestras normas de comunidad conforme a nuestro absoluto criterio.
            
Declaraciones, Garantías e Indemnizaciones. Declaras y garantizas a Amazon, sus filiales y sublicenciatarios que (a) tiene el derecho de conceder las licencias establecidas de estos términos y condiciones, incluyendo todos los derechos necesarios para la reproducción, distribución y otro uso de los materiales por parte de Amazon, sus filiales y sublicenciatarios, tal como se permite en el presente documento, y (b) los materiales que usted envíe y el ejercicio de los derechos de Amazon, sus filiales y sublicenciatarios conforme a este instrumento, no violarán, malversarán ni infringirán ningún derecho de propiedad intelectual, incluyendo, de manera enunciativa mas no limitativa los derechos de marcas, derechos de autor, derechos morales o derechos de publicidad de terceros. Te comprometes a indemnizar, defender y liberar de responsabilidad a Amazon, sus filiales y sublicenciatarios (incluyendo terceros que proporcionen productos personalizados y servicios relacionados) respecto a cualquier reclamación, responsabilidad, daños y gastos (incluyendo, de manera enunciativa mas no limitativa honorarios y gastos razonables de abogados) que deriven del incumplimiento de estos términos y condiciones.''',
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
