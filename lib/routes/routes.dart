import 'package:rdguide/pages/Actualizardato_pages.dart';
import 'package:rdguide/pages/acercaDe_page.dart';
import 'package:rdguide/pages/ayuda_page.dart';
import 'package:rdguide/pages/configuracion_page.dart';
import 'package:rdguide/pages/cancelacion_reserva.dart';
import 'package:rdguide/pages/comofunciona_page.dart';
import 'package:rdguide/pages/credi_card_home.dart';
import 'package:rdguide/pages/detalle_lugar.dart';
import 'package:rdguide/pages/detalle_page.dart';
import 'package:rdguide/pages/google_map.dart';
import 'package:rdguide/pages/guia_turs1.dart';
import 'package:rdguide/pages/guia_turs2.dart';
import 'package:rdguide/pages/guia_turs3.dart';
import 'package:rdguide/pages/hotel_detalle_area.dart';
import 'package:rdguide/pages/hotel_habitaciones_page.dart';
import 'package:rdguide/pages/hotel_page.dart';
import 'package:rdguide/pages/main_pages/lugaresporcat_page.dart';
import 'package:rdguide/pages/opcion_guias.dart';
import 'package:rdguide/pages/pagar_reservacion.dart';
import 'package:rdguide/pages/perfil_usuario_new.dart';
import 'package:rdguide/pages/realizar_reserva.dart';
import 'package:rdguide/pages/reserva_comple.dart';
import 'package:rdguide/pages/termino_servicio_page.dart';
import 'package:flutter/material.dart';
import 'package:rdguide/pages/main_pages/home_page.dart';
import 'package:rdguide/pages/login_page_new.dart';
import 'package:rdguide/pages/tarjetas_opcion_page.dart';
import 'package:rdguide/pages/notificacion_page.dart';
import 'package:rdguide/pages/perfil_usuario_page.dart';
import 'package:rdguide/pages/registro_usuario.dart';
import 'package:rdguide/pages/seguridad_page.dart';
import 'package:rdguide/pages/cambiar_pass.dart';
import 'package:rdguide/pages/detalle_evento.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home':              (BuildContext context) => HomePage(),
    '/login':             (BuildContext context) => LoginPage(),
    '/register':          (BuildContext context) => RegistroUsuarioPage(),
    ///cuenta':            (BuildContext context) => PerfilPage(),
    '/cuentaNew':         (BuildContext context) => PerfilNewPage(),
    '/seguridad':         (BuildContext context) => SeguridadPage(),
    '/notificaciones':    (BuildContext context) => NotificationPage(),
    '/registrartarj':     (BuildContext context) => MySample(),
    '/tarjetas':          (BuildContext context) => TarjetaOpcionPage(),
    '/cambiarPass':       (BuildContext context) => CambioPassPage(),
    '/terminoservicio':   (BuildContext context) => TerminoServicio(),
    '/ayuda':             (BuildContext context) => Ayuda(),
    '/acercade':          (BuildContext context) => AcercaDe(),
    '/ajustes':           (BuildContext context) => ConfiPage(),
    '/actualizarDatos':   (BuildContext context) => ActualizarDatosPage(),
    '/portadaDestino':    (BuildContext context) => DetallePage(),
    '/resultado':         (BuildContext context) => LugaresCategoria(),
    '/cancelacion':       (BuildContext context) => CancelacionPage(),
    '/comofunciona':      (BuildContext context) => Comofunciona(),
    '/pagareserva':       (BuildContext context) => PagarReserva(),
    '/detalleLugar':      (BuildContext context) => DetalleLugar(),
    '/hotel':             (BuildContext context) => HotelPage(),
    '/hotel/areas':       (BuildContext context) => HotelAreasPage(),
    '/evento':            (BuildContext context) => EventoPage(),
    '/detallearea':       (BuildContext context) => HotelDetalleArea(),
    '/realizarreserva':   (BuildContext context) => RealizarReservaPage(),
    '/MapaG':             (BuildContext context) => MapaG(),
    '/guia1':             (BuildContext context) => Guia1Page(),
    '/guia2':             (BuildContext context) => Guia2Page(),
    '/guia3':             (BuildContext context) => Guia3Page(),
    '/opcionguias':       (BuildContext context) => OpcionGuiasPage(),
    '/reservacompleta':   (BuildContext context) => ReservaHotelPage()

  };
}
