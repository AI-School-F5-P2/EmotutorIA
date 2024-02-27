import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Welcome
  {
    '1eqxm04s': {
      'es': '¡Continuar!',
      'en': '',
    },
    '28xyb0l6': {
      'es': '¡Te damos la Bienvenida!',
      'en': '',
    },
    'r93qei2c': {
      'es':
          'Ayúdanos a preparar un aprendizaje hecho a tu medida respondiendo a unas pocas preguntas  ',
      'en': '',
    },
    'amqm22te': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag1
  {
    'ofwshz5o': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    '1xvj5ih2': {
      'es': 'Siguiente',
      'en': '',
    },
    'orf5w92m': {
      'es': 'Test inicial',
      'en': '',
    },
    'zbbkd9lj': {
      'es': 'Home',
      'en': '',
    },
  },
  // chat_ai_Screen
  {
    'e75ee1v2': {
      'es': 'Copiar respuesta',
      'en': '',
    },
    'q5qhi171': {
      'es': '¿Cómo puedo ayudarte hoy?',
      'en': '',
    },
    '1c56m7w4': {
      'es': 'Chat Tutor',
      'en': '',
    },
    'r6j0d6cy': {
      'es': 'Asistente',
      'en': '',
    },
  },
  // Logoanimation
  {
    '64cn8flt': {
      'es': 'Home',
      'en': '',
    },
  },
  // Visualexercise_1
  {
    'jegyy2sh': {
      'es':
          'The farmer diligently works plowing the land \nto prepare it for planting',
      'en': '',
    },
    '0f93u6d9': {
      'es':
          'The sun shines brightly in the blue sky \nwhile birds sing cheerful melodies',
      'en': '',
    },
    'a5kawx16': {
      'es':
          'A group of children plays soccer in the park \nwhile their laughter fills the air',
      'en': '',
    },
    'ngu2l6xf': {
      'es':
          'An expert chef prepares an exquisite gourmet\ndinner for her discerning diners',
      'en': '',
    },
    '75bkdhfc': {
      'es': 'Revisar',
      'en': '',
    },
    'x4gd794g': {
      'es': 'Lección 01',
      'en': '',
    },
    '93hxsr35': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag2
  {
    'q3ed6k5x': {
      'es': 'Pregunta 2/10',
      'en': '',
    },
    '0ymmg0u4': {
      'es':
          'Al recibir enseñanza de un profesor o presentador, ¿Qué enfoque prefieres?',
      'en': '',
    },
    'phykt81o': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    'rpz2s9jw': {
      'es': 'Participar en charlas interactivas',
      'en': '',
    },
    'lbhrzsv3': {
      'es': 'Utilizar gráficos y mapas visuales',
      'en': '',
    },
    'niot0ejn': {
      'es': 'Experimentar demostraciones prácticas',
      'en': '',
    },
    '94pt4h4k': {
      'es': 'Explorar materiales de lectura atractivos',
      'en': '',
    },
    'brehitxw': {
      'es': 'Atrás',
      'en': '',
    },
    'ij9tbxe2': {
      'es': 'Siguiente',
      'en': '',
    },
    '4szipjdj': {
      'es': 'Test inicial',
      'en': '',
    },
    'b7okkmf2': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag3
  {
    'k19s1lri': {
      'es': 'Pregunta 3/10',
      'en': '',
    },
    'zy4id0su': {
      'es': '¿Cómo mejorarías tus habilidades \nen fotografía?',
      'en': '',
    },
    'tprdvfnw': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    'zkoh7t3f': {
      'es': 'Haciendo preguntas sobre la cámara',
      'en': '',
    },
    '4fbynn9f': {
      'es': 'Viendo diagramas de la cámara',
      'en': '',
    },
    '244md4f4': {
      'es': 'Siguiendo instrucciones escritas',
      'en': '',
    },
    '3z6efrps': {
      'es': 'Viendo ejemplos de fotos',
      'en': '',
    },
    'drirq8q7': {
      'es': 'Atrás',
      'en': '',
    },
    'rgffvf31': {
      'es': 'Siguiente',
      'en': '',
    },
    'ktcw0cbl': {
      'es': 'Test inicial',
      'en': '',
    },
    'hoy7nusn': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag4
  {
    'f5s6tdlz': {
      'es': 'Pregunta 4/10',
      'en': '',
    },
    'ingo047v': {
      'es':
          '¿Qué haces si quieres obtener mas información sobre un nuevo proyecto?',
      'en': '',
    },
    'dzdj76me': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    'jsuv0jyr': {
      'es': 'Participar en charlas sobre las características clave',
      'en': 'View videos or images',
    },
    'ihomoxip': {
      'es': 'Observar esquemas visuales de éxito del proyecto',
      'en':
          'Listening to someone explain it to me or reading the instructions out loud',
    },
    'b2ptyru1': {
      'es': 'Experimentar con ejemplos prácticos referentes al proyecto',
      'en': 'Read instructions or articles',
    },
    'flegbrww': {
      'es': 'Asistir a presentaciones con gráficos de beneficios y costos',
      'en': 'Practice or do something yourself',
    },
    'ybjjw8gk': {
      'es': 'Atrás',
      'en': '',
    },
    'q7cqm1hq': {
      'es': 'Siguiente',
      'en': '',
    },
    '0hwpookz': {
      'es': 'Test inicial',
      'en': '',
    },
    'f1477gbg': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag5
  {
    'ts44ows4': {
      'es': 'Pregunta 5/10',
      'en': '',
    },
    'z4yw0ptx': {
      'es':
          '¿Qué te resulta más fácil para aprender a jugar un juego de mesa nuevo?',
      'en': '',
    },
    '9b0u1m2w': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    '18s0zrat': {
      'es': 'Seguir los diagramas y las reglas',
      'en': 'View videos or images',
    },
    'aiprmo19': {
      'es': 'Mirar cómo juegan otros',
      'en':
          'Listening to someone explain it to me or reading the instructions out loud',
    },
    'd58iufy4': {
      'es': 'Leer las instrucciones',
      'en': 'Read instructions or articles',
    },
    '3zsri92a': {
      'es': 'Participar en demostraciones prácticas',
      'en': 'Practice or do something yourself',
    },
    '9fioz1ip': {
      'es': 'Atrás',
      'en': '',
    },
    'frfqjmnv': {
      'es': 'Siguiente',
      'en': '',
    },
    '9yewituz': {
      'es': 'Test inicial',
      'en': '',
    },
    'kai2qy6t': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag6
  {
    'komoia35': {
      'es': 'Pregunta 6/10',
      'en': '',
    },
    'wkowxerp': {
      'es': 'Si quieres aprender a hacer algo en el ordenador tú...',
      'en': '',
    },
    'cz3ftohu': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    '54kpexvs': {
      'es': 'Ves videos tutoriales en Youtube',
      'en': 'View videos or images',
    },
    'd5ydhis8': {
      'es': 'Sigues las instrucciones escritas',
      'en':
          'Listening to someone explain it to me or reading the instructions out loud',
    },
    'ogs2djae': {
      'es': 'Participar en demostraciones prácticas',
      'en': 'Read instructions or articles',
    },
    'b1pjvvb4': {
      'es': 'Leer las instrucciones',
      'en': 'Practice or do something yourself',
    },
    '9v8ljkg5': {
      'es': 'Atrás',
      'en': '',
    },
    'i7pnimhh': {
      'es': 'Siguiente',
      'en': '',
    },
    'kmayjhy3': {
      'es': 'Test inicial',
      'en': '',
    },
    'yr12prsj': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag7
  {
    'nlsup2a4': {
      'es': 'Pregunta 7/10',
      'en': '',
    },
    'r5mafzs1': {
      'es':
          '¿Qué te importa más a la hora de elegir una carrera o área de estudio?',
      'en': '',
    },
    'p78vwgp5': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    'wh5p0vi7': {
      'es': 'Aplicar conocimientos en situaciones reales',
      'en': 'View videos or images',
    },
    'urdt6nju': {
      'es': 'Comunicarte bien por escrito',
      'en':
          'Listening to someone explain it to me or reading the instructions out loud',
    },
    'l8jxdbr8': {
      'es': 'Trabajar con diseños visuales',
      'en': 'Read instructions or articles',
    },
    'ak4091s3': {
      'es': 'Comunicarte con otros mediante conversaciones',
      'en': 'Practice or do something yourself',
    },
    '3uinofbn': {
      'es': 'Atrás',
      'en': '',
    },
    'vyqk8xsz': {
      'es': 'Siguiente',
      'en': '',
    },
    '05im60sg': {
      'es': 'Test inicial',
      'en': '',
    },
    '18bvz3z6': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag8
  {
    'jbbva77q': {
      'es': 'Pregunta 8/10',
      'en': '',
    },
    'i9y42awb': {
      'es':
          'Quieres aprender a tocar una canción en un instrumento musical, ¿Qué método utilizarías? ',
      'en': '',
    },
    'gb0tfbbs': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    'qf2dx78h': {
      'es': 'Seguir las partituras ó las tablaturas paso a paso',
      'en': 'View videos or images',
    },
    '5bgdmeo4': {
      'es': 'Ver algún tutorial práctico en Youtube',
      'en':
          'Listening to someone explain it to me or reading the instructions out loud',
    },
    'ptnnjppb': {
      'es': 'Recibir consejos de alguien con experiencia en música',
      'en': 'Read instructions or articles',
    },
    '7ncj6mce': {
      'es': 'Leer explicaciones claras sobre la interpretación de la canción',
      'en': 'Practice or do something yourself',
    },
    '3w51bsib': {
      'es': 'Atrás',
      'en': '',
    },
    'se6bfkwu': {
      'es': 'Siguiente',
      'en': '',
    },
    'vrcl9gm3': {
      'es': 'Test inicial',
      'en': '',
    },
    'ucl0tbl6': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag9
  {
    've9ni21v': {
      'es': 'Pregunta 9/10',
      'en': '',
    },
    'j2wjayfc': {
      'es':
          'Al explorar información en Internet, ¿Qué formato de contenido encuentras más efectivo para aprender?',
      'en': '',
    },
    '75992bzn': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    '2qs1mbt3': {
      'es': 'Videos prácticos y demostrativos',
      'en': 'View videos or images',
    },
    '6zkyoqsz': {
      'es': 'Audios divertidos y educativos',
      'en':
          'Listening to someone explain it to me or reading the instructions out loud',
    },
    'i1o6f7i4': {
      'es': 'Textos explicativos interesantes',
      'en': 'Read instructions or articles',
    },
    '2kndjm15': {
      'es': 'Diseño visual atractivo',
      'en': 'Practice or do something yourself',
    },
    'diy24r9i': {
      'es': 'Atrás',
      'en': '',
    },
    'perl7x3b': {
      'es': 'Siguiente',
      'en': '',
    },
    'uam9ll4p': {
      'es': 'Test inicial',
      'en': '',
    },
    'm2baabdm': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag10
  {
    'gzhjyxnd': {
      'es': 'Pregunta 10/10',
      'en': '',
    },
    'j01t1x0e': {
      'es':
          'Cuando consideras tu estilo de aprendizaje en general, ¿Qué enfoque se adapta mejor a ti?',
      'en': '',
    },
    'pifaal2u': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    '4jh3bcx2': {
      'es': 'Identificando patrones y conexiones',
      'en': 'View videos or images',
    },
    'p0cjpxea': {
      'es': 'Leyendo materiales variados',
      'en':
          'Listening to someone explain it to me or reading the instructions out loud',
    },
    '689ao1hm': {
      'es': 'Aplicando ejemplos y casos prácticos',
      'en': 'Read instructions or articles',
    },
    'zx1n32cn': {
      'es': 'Participando en discusiones y foros',
      'en': 'Practice or do something yourself',
    },
    '408plilb': {
      'es': 'Atrás',
      'en': '',
    },
    'j2tf1ypv': {
      'es': 'Finalizar',
      'en': '',
    },
    'p99wz625': {
      'es': 'Test inicial',
      'en': '',
    },
    'fvklt2kl': {
      'es': 'Home',
      'en': '',
    },
  },
  // Videoexercise_1
  {
    'xtgcdtix': {
      'es': '',
      'en': '',
    },
    'p574c83r': {
      'es': 'Lord Farquaad says the donkey is a\nprecious animal',
      'en': '',
    },
    'g8pxo757': {
      'es': 'Shrek says he wants to exercise',
      'en': '',
    },
    'lvrqf04g': {
      'es': 'They are all very good friends and are going to celebrate a party',
      'en': '',
    },
    'v941g5uq': {
      'es': 'Whoever kills Shrek will be named champion',
      'en': '',
    },
    'i4mqj598': {
      'es': 'Revisar',
      'en': '',
    },
    'xhf3v1i8': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'beg9gnjo': {
      'es': 'Home',
      'en': '',
    },
  },
  // Audioexercise_1
  {
    'zz18dd5i': {
      'es':
          '"Helen is worried because she doesn\'t know how to draw and can\'t help her son with drawing a picture of a castle for school. \n\nThat\'s why she asks her friend Su for help, who gladly accepts"',
      'en': '',
    },
    'hxj67978': {
      'es': 'Revisar',
      'en': '',
    },
    '3otffr41': {
      'es': 'Ejercicio 02',
      'en': '',
    },
    'w7o40z80': {
      'es': 'Ejercicios',
      'en': '',
    },
  },
  // Success_page
  {
    'nrn9me76': {
      'es': '¡Correcto!',
      'en': '',
    },
    'dci3mvwd': {
      'es': 'Muy bien hecho, sigamos adelante\ncon tu aprendizaje',
      'en': '',
    },
    '12hl6abh': {
      'es': '¡Continuar!',
      'en': '',
    },
    'wq9llcg0': {
      'es': 'Home',
      'en': '',
    },
  },
  // audioexercise2
  {
    '1q5ptkcf': {
      'es': 'Listening',
      'en': '',
    },
    's091bvs7': {
      'es': 'I was just guessing at numbers and figures',
      'en': '',
    },
    'ooadid1h': {
      'es': 'I want to order a pizza.',
      'en': '',
    },
    '1njz7kty': {
      'es': 'Questions of history, history and progress.',
      'en': '',
    },
    '7rmwkltd': {
      'es': 'Everybody said it was difficult.',
      'en': '',
    },
    '0sgrq3wl': {
      'es': 'Revisar',
      'en': '',
    },
    'ljvhlj02': {
      'es': 'Ejercicio 02',
      'en': '',
    },
    'ej6thx59': {
      'es': 'Home',
      'en': '',
    },
  },
  // Before_results
  {
    '8imvhu9g': {
      'es': '¡Ya casi terminamos!',
      'en': '',
    },
    'ouva2tu3': {
      'es':
          'Recuerda que este Test es solo un estudio inicial para determinar el tipo de aprendizaje que más se ajuste según las respuestas obtenidas. \n\n¡Más adelante vamos a ir ajustándonos a tus necesidades!',
      'en': '',
    },
    'zjejphqp': {
      'es': 'Resultados',
      'en': '',
    },
    'wgwbhmxe': {
      'es': 'Pulsa el botón para continuar',
      'en': '',
    },
    '8atd78zq': {
      'es': 'Test',
      'en': '',
    },
    'dhiemrx6': {
      'es': 'Home',
      'en': '',
    },
  },
  // Kinestheticexercise_1
  {
    'hkiu8lno': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'wm7uujnz': {
      'es':
          'Lee cada una de las adivinanzas, piensa en la respuesta y toca cada tarjeta para conocer si acertaste:',
      'en': '',
    },
    '4rc7le96': {
      'es': 'What has an eye but cannot see?',
      'en': '',
    },
    'kiuqb71z': {
      'es': 'A needle',
      'en': '',
    },
    'iaak04jx': {
      'es':
          'What has cities, mountains, and water, but no houses, trees, \nor fish?',
      'en': '',
    },
    'sm6zpamv': {
      'es': 'A map',
      'en': '',
    },
    'c7jyda5y': {
      'es': 'What has hands but cannot clap?',
      'en': '',
    },
    '75aiarr3': {
      'es': 'A clock',
      'en': '',
    },
    'bn3or8l9': {
      'es': 'What has a neck without a head?',
      'en': '',
    },
    '2fsfzpj8': {
      'es': 'A bottle',
      'en': '',
    },
    'xafpd3lu': {
      'es': 'Finalizar',
      'en': '',
    },
    '1wxmuiv5': {
      'es': 'Home',
      'en': '',
    },
  },
  // SimonSays
  {
    '01dpcuul': {
      'es': 'Realiza la acción que corresponda en la imagen:',
      'en': '',
    },
    'fz1u0ya4': {
      'es': 'Simon says: "Clap your hands twice"',
      'en': '',
    },
    'q3cmkyop': {
      'es': 'simon says: "Take three steps forward."',
      'en': '',
    },
    'f8bi1ltt': {
      'es': 'Simon says: "Jump three times."',
      'en': '',
    },
    'pn8y12l7': {
      'es': 'Siguiente',
      'en': '',
    },
    'tq8w6tcg': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'zfn2h9w9': {
      'es': 'Home',
      'en': '',
    },
  },
  // test_pag1Copy
  {
    'mrwqg2lj': {
      'es': 'Pregunta 1/10',
      'en': '',
    },
    'zr6zcm6b': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    '5syk7p1n': {
      'es': 'Next',
      'en': '',
    },
    '37nqv34m': {
      'es': 'Test inicial',
      'en': '',
    },
    'jpn86391': {
      'es': 'Home',
      'en': '',
    },
  },
  // chatbotLeire
  {
    '9ssutj88': {
      'es': '¡Hola!\nSoy tu tutora personalizada',
      'en': '',
    },
    'o0ypxskd': {
      'es': '\n¿Cómo te sientes hoy?',
      'en': '',
    },
    'c8c8jvb5': {
      'es': 'Selecciona una opción',
      'en': '',
    },
    'mlgptea6': {
      'es': 'Chatbot Leire',
      'en': '',
    },
    '8pbrvx0f': {
      'es': 'Home',
      'en': '',
    },
  },
  // Loading_page
  {
    'sbjc4n6r': {
      'es': 'Home',
      'en': '',
    },
  },
  // Unsuccess_page
  {
    'luvk50ub': {
      'es': '¡Upss!',
      'en': '',
    },
    'rrbx629b': {
      'es': 'La respuesta no es la correcta, ¡Vamos a intentarlo otra vez!',
      'en': '',
    },
    '5thj36n6': {
      'es': 'Reintentar',
      'en': '',
    },
    'b85b6pqy': {
      'es': 'Home',
      'en': '',
    },
  },
  // mentalHealth
  {
    'vqqnvp3l': {
      'es': 'Cuidamos de tu bienestar',
      'en': '',
    },
    '8dnkxchh': {
      'es': 'Siguiente',
      'en': '',
    },
    'ual6ms0v': {
      'es': 'Home',
      'en': '',
    },
  },
  // mentalHealthCopy
  {
    'j1zhw57c': {
      'es': 'Cuidamos de tu salud',
      'en': '',
    },
    'vzqoyyvb': {
      'es': 'Siguiente',
      'en': '',
    },
    'mac9w01c': {
      'es': 'Home',
      'en': '',
    },
  },
  // Homepage_Visual
  {
    'it7qu7s0': {
      'es': 'Hola, ',
      'en': '',
    },
    '65jmoo81': {
      'es': 'José luis',
      'en': '',
    },
    'xmh746nr': {
      'es': 'Home',
      'en': '',
    },
  },
  // Readingexercise_1
  {
    'dg55m1dy': {
      'es':
          'Mount Everest, the tallest mountain in the world, stands proudly at 29,032 feet above sea level. Located in the Himalayas, it offers a challenging climb for experienced mountaineers. \n\nDespite its beauty, Everest poses many risks, including extreme weather conditions and altitude sickness. Climbers must undergo extensive training and preparation before attempting the ascent.',
      'en': '',
    },
    'p6nlmqwb': {
      'es': '',
      'en': '',
    },
    '0zx64yfj': {
      'es': 'Mount Everest is the tallest mountain in the Rocky Mountains',
      'en': '',
    },
    '085j1jl8': {
      'es': 'Mount Everest is located in the\nHimalayas',
      'en': '',
    },
    'jykstkm0': {
      'es':
          'Climbing Mount Everest is easy and \ndoesn\'t require much preparation',
      'en': '',
    },
    '3jg9ll7e': {
      'es': 'Altitude sickness is not a concern \nwhen climbing Mount Everest',
      'en': '',
    },
    'xqxpolrn': {
      'es': 'Revisar',
      'en': '',
    },
    '7svh8d69': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'rsvmhhg1': {
      'es': 'Home',
      'en': '',
    },
  },
  // SimonSaysCopy
  {
    'hqonypn8': {
      'es': 'Realiza la acción que corresponda en la imagen:',
      'en': '',
    },
    'p8rgisq1': {
      'es': 'Simon says: "Clap your hands twice."',
      'en': '',
    },
    'gsmzqis2': {
      'es': '\nSimon says: "Take three steps forward."',
      'en': '',
    },
    '2qqyki0b': {
      'es': 'Siguiente',
      'en': '',
    },
    'sprlvbtg': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    '8x46srxg': {
      'es': 'Home',
      'en': '',
    },
  },
  // Visualexercise_2Copy
  {
    '4swo5rmq': {
      'es': 'Selecciona, según la descripción, la imagen\ncorrespondiente:',
      'en': '',
    },
    'z3q5p3f3': {
      'es': 'Student',
      'en': '',
    },
    'qt8wjmbn': {
      'es': 'Doctor',
      'en': '',
    },
    'y1zr0v1l': {
      'es': 'Professor',
      'en': '',
    },
    '2ahywe2z': {
      'es': 'Revisar',
      'en': '',
    },
    '9nj750cj': {
      'es': 'Ejercicio 02',
      'en': '',
    },
    'gjg3892r': {
      'es': 'Home',
      'en': '',
    },
  },
  // success_audio1
  {
    'irpgs3fg': {
      'es': '¡Correcto!',
      'en': '',
    },
    '6n8ycghl': {
      'es': 'Muy bien hecho, sigamos adelante\ncon tu aprendizaje',
      'en': '',
    },
    'hewccir6': {
      'es': '¡Continuar!',
      'en': '',
    },
    '6s7xvxza': {
      'es': 'Home',
      'en': '',
    },
  },
  // unsuccess_audio1
  {
    'ae34qonw': {
      'es': '¡Upss!',
      'en': '',
    },
    '673rsadv': {
      'es': 'La respuesta no es la correcta, ¡Vamos a intentarlo otra vez!',
      'en': '',
    },
    'wtlpvwfr': {
      'es': 'Reintentar',
      'en': '',
    },
    'daaxxjqh': {
      'es': 'Home',
      'en': '',
    },
  },
  // unsuccess_video1
  {
    'rm3w9ynf': {
      'es': '¡Upss!',
      'en': '',
    },
    '6je833sy': {
      'es': 'La respuesta no es la correcta, ¡Vamos a intentarlo otra vez!',
      'en': '',
    },
    'k3w3j8pz': {
      'es': 'Reintentar',
      'en': '',
    },
    '4f15bjm2': {
      'es': 'Home',
      'en': '',
    },
  },
  // unsuccess_read1
  {
    '9jx8mxgh': {
      'es': '¡Upss!',
      'en': '',
    },
    '8avsxzxb': {
      'es': 'La respuesta no es la correcta, ¡Vamos a intentarlo otra vez!',
      'en': '',
    },
    'e7lcd27v': {
      'es': 'Reintentar',
      'en': '',
    },
    'bt9utgad': {
      'es': 'Home',
      'en': '',
    },
  },
  // unsuccess_visual1
  {
    'je9pay9e': {
      'es': '¡Upss!',
      'en': '',
    },
    'uq24q2ni': {
      'es': 'La respuesta no es la correcta, ¡Vamos a intentarlo otra vez!',
      'en': '',
    },
    '9q9au2op': {
      'es': 'Reintentar',
      'en': '',
    },
    '67cbfqb9': {
      'es': 'Home',
      'en': '',
    },
  },
  // unsuccess_visual2
  {
    'e2qs952v': {
      'es': '¡Upss!',
      'en': '',
    },
    '3avn3rrc': {
      'es': 'La respuesta no es la correcta, ¡Vamos a intentarlo otra vez!',
      'en': '',
    },
    '9gcifqp6': {
      'es': 'Reintentar',
      'en': '',
    },
    'd8khlqp8': {
      'es': 'Home',
      'en': '',
    },
  },
  // succes_visual1
  {
    'v58wk37s': {
      'es': '¡Correcto!',
      'en': '',
    },
    '9xzesyap': {
      'es': 'Muy bien hecho, sigamos adelante\ncon tu aprendizaje',
      'en': '',
    },
    'ouha3ypf': {
      'es': '¡Continuar!',
      'en': '',
    },
    'nhkmfdue': {
      'es': 'Home',
      'en': '',
    },
  },
  // profile_audi
  {
    'frzd0in0': {
      'es': '¡Perfil \nAuditivo!',
      'en': '',
    },
    '1vyrbm0k': {
      'es':
          'Optas por el aprendizaje a través del oído. Prefieres la información presentada de manera oral y encuentras efectivo el aprendizaje a través de discusiones y charlas.',
      'en': '',
    },
    '328ywbg9': {
      'es': '¡Comenzar!',
      'en': '',
    },
    'sz3lu1qt': {
      'es': 'Home',
      'en': '',
    },
  },
  // perfil_lector
  {
    'g995p4lp': {
      'es': '¡Perfil Lector - Escritor!',
      'en': '',
    },
    'fzyzu6sz': {
      'es':
          'Te gusta más aprender a través de la lectura y la escritura. Prefieres textos, manuales, y encuentras que tomar apuntes es una estrategia efectiva.',
      'en': '',
    },
    'y18uzhhh': {
      'es': '¡Comenzar!',
      'en': '',
    },
    '33k8h4il': {
      'es': 'Home',
      'en': '',
    },
  },
  // perfil_visual
  {
    'g1wdp5gg': {
      'es': '¡Perfil Visual!',
      'en': '',
    },
    'bdxv62kp': {
      'es':
          'Prefieres aprender a través de imágenes y gráficos, tiendes a pensar en términos de representaciones visuales.',
      'en': '',
    },
    '5a39o9cg': {
      'es': '¡Comenzar!',
      'en': '',
    },
    'o3vdmp6m': {
      'es': 'Home',
      'en': '',
    },
  },
  // perfil_kinestesico
  {
    'zjjdzawk': {
      'es': '¡Perfil \nKinestésico!',
      'en': '',
    },
    'i45ik9hc': {
      'es':
          'Tu estilo de aprendizaje está orientado hacia la experiencia práctica y la acción. Aprendes mejor cuando puedes realizar actividades físicas o prácticas relacionadas con el tema.',
      'en': '',
    },
    'zpv47m3r': {
      'es': '¡Comenzar!',
      'en': '',
    },
    's3wqztww': {
      'es': 'Home',
      'en': '',
    },
  },
  // Homepage_Lector
  {
    'wpq2tacx': {
      'es': 'Hola, ',
      'en': '',
    },
    'ih23qeiu': {
      'es': 'José luis',
      'en': '',
    },
    'ohqep14r': {
      'es': 'Selecciona una opción:',
      'en': '',
    },
    'sm4zwnuw': {
      'es': 'Ejercicios',
      'en': '',
    },
  },
  // Homepage_kinestesico
  {
    'z4e3l214': {
      'es': 'Hola, ',
      'en': '',
    },
    'o2gpfgdq': {
      'es': 'José luis',
      'en': '',
    },
    'e3zic34u': {
      'es': 'Home',
      'en': '',
    },
  },
  // Success_pageCopy
  {
    'smucov7s': {
      'es': '¡Correcto!',
      'en': '',
    },
    'x1l4h0oo': {
      'es': 'Muy bien hecho, sigamos adelante\ncon tu aprendizaje',
      'en': '',
    },
    'donngo6d': {
      'es': '¡Continuar!',
      'en': '',
    },
    '4puxel9h': {
      'es': 'Home',
      'en': '',
    },
  },
  // Homepage_Auditivo
  {
    'w78b8k1e': {
      'es': 'Hola, ',
      'en': '',
    },
    'i972e7ie': {
      'es': 'Paloma',
      'en': '',
    },
    '7r2azxwd': {
      'es': 'Selecciona una opción:',
      'en': '',
    },
    '6a3f05j9': {
      'es': 'Ejercicios',
      'en': '',
    },
  },
  // success_kinest
  {
    'mgq12cbu': {
      'es': '¡Correcto!',
      'en': '',
    },
    'chreaoud': {
      'es': 'Muy bien hecho, sigamos adelante\ncon tu aprendizaje',
      'en': '',
    },
    'vkvr4or8': {
      'es': '¡Continuar!',
      'en': '',
    },
    'nhn69dg8': {
      'es': 'Home',
      'en': '',
    },
  },
  // chat_ai_ScreenCopy
  {
    'l4kq0r18': {
      'es': 'Hola, soy Leire',
      'en': '',
    },
    'wgevuo3z': {
      'es': 'Copiar respuesta',
      'en': '',
    },
    'zb9102le': {
      'es': '¿Cómo puedo ayudarte hoy?',
      'en': '',
    },
    'ruosxfvb': {
      'es': 'Asistente',
      'en': '',
    },
  },
  // Homepage_kinestesicoCopy
  {
    'ipdz4zj8': {
      'es': 'Hola, ',
      'en': '',
    },
    'mvc4whny': {
      'es': 'José luis',
      'en': '',
    },
    '9qkjej00': {
      'es': 'Home',
      'en': '',
    },
  },
  // emptyList
  {
    'p722h09t': {
      'es': 'Ai Chat Active!',
      'en': '',
    },
    '5lyz86hw': {
      'es':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'en': '',
    },
    '7essrq4v': {
      'es': 'https://platform.openai.com',
      'en': '',
    },
    'hge7j23e': {
      'es': 'Watch Tutorial',
      'en': '',
    },
  },
  // aiChat_Component
  {
    'bpa7rz67': {
      'es': 'Como puedo ayudarte?',
      'en': '',
    },
  },
  // comenzbutton
  {
    '0bs377cs': {
      'es': '¡Comencemos!',
      'en': '',
    },
  },
  // test_button
  {
    'hpc6w2fc': {
      'es':
          'Escuchar a alguien que me explique ó \nleyendo las instrucciones en voz alta ',
      'en': '',
    },
  },
  // cardlector
  {
    '3gfo62gh': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'kpme3v9h': {
      'es': 'Read and select the correct option',
      'en': '',
    },
    'lhhhyp7e': {
      'es': 'Progreso:',
      'en': '',
    },
  },
  // cardkines
  {
    'ekh2ev7p': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'ov69wk9l': {
      'es': 'Riddles',
      'en': '',
    },
    'bmyc6w7l': {
      'es': 'Progreso:',
      'en': '',
    },
    'zekl2h7w': {
      'es': '0/1',
      'en': '',
    },
  },
  // cardvisual1
  {
    '46oze8mc': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    '3qds60t2': {
      'es': 'Look and select the correct option',
      'en': '',
    },
    'f47qg9f9': {
      'es': 'Progreso:',
      'en': '',
    },
  },
  // cardvisual2
  {
    'j9r7kica': {
      'es': 'Ejercicio 02',
      'en': '',
    },
    'v7f14fg5': {
      'es': 'Read and select the correct option',
      'en': '',
    },
    'lisnhnhg': {
      'es': 'Progreso:',
      'en': '',
    },
  },
  // cardAudi01
  {
    'nibs62f2': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'varu4mdd': {
      'es': 'Listen and select the correct option',
      'en': '',
    },
    '1usmm68r': {
      'es': 'Progreso:',
      'en': '',
    },
  },
  // cardAudi02
  {
    '2kv9emmm': {
      'es': 'Ejercicio 02',
      'en': '',
    },
    'qq1rlsnu': {
      'es': 'Listen and select the recording corresponding to the text',
      'en': '',
    },
    'elyhksii': {
      'es': 'Progreso:',
      'en': '',
    },
  },
  // ChatContainer
  {
    'g44fbtpe': {
      'es': 'Copy response',
      'en': '',
    },
  },
  // BlankListComponent
  {
    'kw4w98xe': {
      'es':
          '¡Hola, soy Leire tu tutora de inglés personal!\n¿Cómo puedo ayudarte hoy?',
      'en': '',
    },
  },
  // ChatTutor
  {
    'n309zljm': {
      'es': 'Chat Tutor',
      'en': '',
    },
  },
  // ChatbotEmocional
  {
    '6xzjets5': {
      'es': 'Chatbot Leire',
      'en': '',
    },
  },
  // BlankListComponentCopy
  {
    '49l4ef03': {
      'es':
          '¡Hola, soy Leire tu tutora de inglés personal!\n¿Cómo puedo ayudarte hoy?',
      'en': '',
    },
  },
  // cardkinesCopy
  {
    'hdnrdma0': {
      'es': 'Ejercicio 01',
      'en': '',
    },
    'gr0hs963': {
      'es': 'Riddles',
      'en': '',
    },
    '9gqxk12e': {
      'es': 'Progreso:',
      'en': '',
    },
    '9jy9hsqk': {
      'es': '1/1',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'z8lht4kf': {
      'es': '¡Comencemos!',
      'en': '',
    },
    'g1q96ady': {
      'es': '',
      'en': '',
    },
    'ruh668oc': {
      'es': '',
      'en': '',
    },
    'hvwpmbnb': {
      'es': '',
      'en': '',
    },
    'mas77kml': {
      'es': '',
      'en': '',
    },
    'zpn61fo5': {
      'es': '',
      'en': '',
    },
    '7tff476f': {
      'es': '',
      'en': '',
    },
    'ib2fgqdf': {
      'es': '',
      'en': '',
    },
    '2z2zugyb': {
      'es': '',
      'en': '',
    },
    'o0owq0i1': {
      'es': '',
      'en': '',
    },
    's2zhdb8t': {
      'es': '',
      'en': '',
    },
    '02f23hcy': {
      'es': '',
      'en': '',
    },
    'jxgl5d8s': {
      'es': '',
      'en': '',
    },
    'lpxjnryt': {
      'es': '',
      'en': '',
    },
    'uvo04lsr': {
      'es': '',
      'en': '',
    },
    'xjptwa0e': {
      'es': '',
      'en': '',
    },
    'o260zo9y': {
      'es': '',
      'en': '',
    },
    'quxsjv91': {
      'es': '',
      'en': '',
    },
    'sfwm2wr6': {
      'es': '',
      'en': '',
    },
    'unq1o1d0': {
      'es': '',
      'en': '',
    },
    '3jwjhiy6': {
      'es': '',
      'en': '',
    },
    '5j8cfe3v': {
      'es': '',
      'en': '',
    },
    'bpea64ew': {
      'es': '',
      'en': '',
    },
    'kkgec2kn': {
      'es': '',
      'en': '',
    },
    'pqw0f5or': {
      'es': '',
      'en': '',
    },
    '5agu5kbz': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
