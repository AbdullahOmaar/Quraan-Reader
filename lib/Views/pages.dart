import 'package:flutter/material.dart';
import 'side_drawer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../View_Model/create_db.dart';
import '../Models/Aya.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        ind: 0,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int ind;
  const MyHomePage({Key? key, required this.ind}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  _MyHomePageState(){
    itemScrollController = ScrollController(initialScrollOffset: 2.0);
  }

  late final ScrollController itemScrollController ;
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  int _xPosition = 0;
  int yPosition = 0;
  late List<Aya> _ayasPage;
  bool flag = false;
  bool check = false;
  late Offset _offset;
  late int flagImageMarker;

  late List<dynamic> coordinates;

  List<Widget> imageCard = [];
  List<String> images = [
    './assets/Pages/001-mod.png',
    './assets/Pages/002-mod.png',
    './assets/Pages/003-mod.png',
    './assets/Pages/004-mod.png',
    './assets/Pages/005-mod.png',
    './assets/Pages/006-mod.png',
    './assets/Pages/007-mod.png',
    './assets/Pages/008-mod.png',
    './assets/Pages/009-mod.png',
    './assets/Pages/010-mod.png',
    './assets/Pages/011-mod.png',
    './assets/Pages/012-mod.png',
    './assets/Pages/013-mod.png',
    './assets/Pages/014-mod.png',
    './assets/Pages/015-mod.png',
    './assets/Pages/016-mod.png',
    './assets/Pages/017-mod.png',
    './assets/Pages/018-mod.png',
    './assets/Pages/019-mod.png',
    './assets/Pages/020-mod.png',
    './assets/Pages/021-mod.png',
    './assets/Pages/022-mod.png',
    './assets/Pages/023-mod.png',
    './assets/Pages/024-mod.png',
    './assets/Pages/025-mod.png',
    './assets/Pages/026-mod.png',
    './assets/Pages/027-mod.png',
    './assets/Pages/028-mod.png',
    './assets/Pages/029-mod.png',
    './assets/Pages/030-mod.png',
    './assets/Pages/031-mod.png',
    './assets/Pages/032-mod.png',
    './assets/Pages/033-mod.png',
    './assets/Pages/034-mod.png',
    './assets/Pages/035-mod.png',
    './assets/Pages/036-mod.png',
    './assets/Pages/037-mod.png',
    './assets/Pages/038-mod.png',
    './assets/Pages/039-mod.png',
    './assets/Pages/040-mod.png',
    './assets/Pages/041-mod.png',
    './assets/Pages/042-mod.png',
    './assets/Pages/043-mod.png',
    './assets/Pages/044-mod.png',
    './assets/Pages/045-mod.png',
    './assets/Pages/046-mod.png',
    './assets/Pages/047-mod.png',
    './assets/Pages/048-mod.png',
    './assets/Pages/049-mod.png',
    './assets/Pages/050-mod.png',
    './assets/Pages/051-mod.png',
    './assets/Pages/052-mod.png',
    './assets/Pages/053-mod.png',
    './assets/Pages/054-mod.png',
    './assets/Pages/055-mod.png',
    './assets/Pages/056-mod.png',
    './assets/Pages/057-mod.png',
    './assets/Pages/058-mod.png',
    './assets/Pages/059-mod.png',
    './assets/Pages/060-mod.png',
    './assets/Pages/061-mod.png',
    './assets/Pages/062-mod.png',
    './assets/Pages/063-mod.png',
    './assets/Pages/064-mod.png',
    './assets/Pages/065-mod.png',
    './assets/Pages/066-mod.png',
    './assets/Pages/067-mod.png',
    './assets/Pages/068-mod.png',
    './assets/Pages/069-mod.png',
    './assets/Pages/070-mod.png',
    './assets/Pages/071-mod.png',
    './assets/Pages/072-mod.png',
    './assets/Pages/073-mod.png',
    './assets/Pages/074-mod.png',
    './assets/Pages/075-mod.png',
    './assets/Pages/076-mod.png',
    './assets/Pages/077-mod.png',
    './assets/Pages/078-mod.png',
    './assets/Pages/079-mod.png',
    './assets/Pages/080-mod.png',
    './assets/Pages/081-mod.png',
    './assets/Pages/082-mod.png',
    './assets/Pages/083-mod.png',
    './assets/Pages/084-mod.png',
    './assets/Pages/085-mod.png',
    './assets/Pages/086-mod.png',
    './assets/Pages/087-mod.png',
    './assets/Pages/088-mod.png',
    './assets/Pages/089-mod.png',
    './assets/Pages/090-mod.png',
    './assets/Pages/091-mod.png',
    './assets/Pages/092-mod.png',
    './assets/Pages/093-mod.png',
    './assets/Pages/094-mod.png',
    './assets/Pages/095-mod.png',
    './assets/Pages/096-mod.png',
    './assets/Pages/097-mod.png',
    './assets/Pages/098-mod.png',
    './assets/Pages/099-mod.png',
    './assets/Pages/100-mod.png',
    './assets/Pages/101-mod.png',
    './assets/Pages/102-mod.png',
    './assets/Pages/103-mod.png',
    './assets/Pages/104-mod.png',
    './assets/Pages/105-mod.png',
    './assets/Pages/106-mod.png',
    './assets/Pages/107-mod.png',
    './assets/Pages/108-mod.png',
    './assets/Pages/109-mod.png',
    './assets/Pages/110-mod.png',
    './assets/Pages/111-mod.png',
    './assets/Pages/112-mod.png',
    './assets/Pages/113-mod.png',
    './assets/Pages/114-mod.png',
    './assets/Pages/115-mod.png',
    './assets/Pages/116-mod.png',
    './assets/Pages/117-mod.png',
    './assets/Pages/118-mod.png',
    './assets/Pages/119-mod.png',
    './assets/Pages/120-mod.png',
    './assets/Pages/121-mod.png',
    './assets/Pages/122-mod.png',
    './assets/Pages/123-mod.png',
    './assets/Pages/124-mod.png',
    './assets/Pages/125-mod.png',
    './assets/Pages/126-mod.png',
    './assets/Pages/127-mod.png',
    './assets/Pages/128-mod.png',
    './assets/Pages/129-mod.png',
    './assets/Pages/130-mod.png',
    './assets/Pages/131-mod.png',
    './assets/Pages/132-mod.png',
    './assets/Pages/133-mod.png',
    './assets/Pages/134-mod.png',
    './assets/Pages/135-mod.png',
    './assets/Pages/136-mod.png',
    './assets/Pages/137-mod.png',
    './assets/Pages/138-mod.png',
    './assets/Pages/139-mod.png',
    './assets/Pages/140-mod.png',
    './assets/Pages/141-mod.png',
    './assets/Pages/142-mod.png',
    './assets/Pages/143-mod.png',
    './assets/Pages/144-mod.png',
    './assets/Pages/145-mod.png',
    './assets/Pages/146-mod.png',
    './assets/Pages/147-mod.png',
    './assets/Pages/148-mod.png',
    './assets/Pages/149-mod.png',
    './assets/Pages/150-mod.png',
    './assets/Pages/151-mod.png',
    './assets/Pages/152-mod.png',
    './assets/Pages/153-mod.png',
    './assets/Pages/154-mod.png',
    './assets/Pages/155-mod.png',
    './assets/Pages/156-mod.png',
    './assets/Pages/157-mod.png',
    './assets/Pages/158-mod.png',
    './assets/Pages/159-mod.png',
    './assets/Pages/160-mod.png',
    './assets/Pages/161-mod.png',
    './assets/Pages/162-mod.png',
    './assets/Pages/163-mod.png',
    './assets/Pages/164-mod.png',
    './assets/Pages/165-mod.png',
    './assets/Pages/166-mod.png',
    './assets/Pages/167-mod.png',
    './assets/Pages/168-mod.png',
    './assets/Pages/169-mod.png',
    './assets/Pages/170-mod.png',
    './assets/Pages/171-mod.png',
    './assets/Pages/172-mod.png',
    './assets/Pages/173-mod.png',
    './assets/Pages/174-mod.png',
    './assets/Pages/175-mod.png',
    './assets/Pages/176-mod.png',
    './assets/Pages/177-mod.png',
    './assets/Pages/178-mod.png',
    './assets/Pages/179-mod.png',
    './assets/Pages/180-mod.png',
    './assets/Pages/181-mod.png',
    './assets/Pages/182-mod.png',
    './assets/Pages/183-mod.png',
    './assets/Pages/184-mod.png',
    './assets/Pages/185-mod.png',
    './assets/Pages/186-mod.png',
    './assets/Pages/187-mod.png',
    './assets/Pages/188-mod.png',
    './assets/Pages/189-mod.png',
    './assets/Pages/190-mod.png',
    './assets/Pages/191-mod.png',
    './assets/Pages/192-mod.png',
    './assets/Pages/193-mod.png',
    './assets/Pages/194-mod.png',
    './assets/Pages/195-mod.png',
    './assets/Pages/196-mod.png',
    './assets/Pages/197-mod.png',
    './assets/Pages/198-mod.png',
    './assets/Pages/199-mod.png',
    './assets/Pages/200-mod.png',
    './assets/Pages/201-mod.png',
    './assets/Pages/202-mod.png',
    './assets/Pages/203-mod.png',
    './assets/Pages/204-mod.png',
    './assets/Pages/205-mod.png',
    './assets/Pages/206-mod.png',
    './assets/Pages/207-mod.png',
    './assets/Pages/208-mod.png',
    './assets/Pages/209-mod.png',
    './assets/Pages/210-mod.png',
    './assets/Pages/211-mod.png',
    './assets/Pages/212-mod.png',
    './assets/Pages/213-mod.png',
    './assets/Pages/214-mod.png',
    './assets/Pages/215-mod.png',
    './assets/Pages/216-mod.png',
    './assets/Pages/217-mod.png',
    './assets/Pages/218-mod.png',
    './assets/Pages/219-mod.png',
    './assets/Pages/220-mod.png',
    './assets/Pages/221-mod.png',
    './assets/Pages/222-mod.png',
    './assets/Pages/223-mod.png',
    './assets/Pages/224-mod.png',
    './assets/Pages/225-mod.png',
    './assets/Pages/226-mod.png',
    './assets/Pages/227-mod.png',
    './assets/Pages/228-mod.png',
    './assets/Pages/229-mod.png',
    './assets/Pages/230-mod.png',
    './assets/Pages/231-mod.png',
    './assets/Pages/232-mod.png',
    './assets/Pages/233-mod.png',
    './assets/Pages/234-mod.png',
    './assets/Pages/235-mod.png',
    './assets/Pages/236-mod.png',
    './assets/Pages/237-mod.png',
    './assets/Pages/238-mod.png',
    './assets/Pages/239-mod.png',
    './assets/Pages/240-mod.png',
    './assets/Pages/241-mod.png',
    './assets/Pages/242-mod.png',
    './assets/Pages/243-mod.png',
    './assets/Pages/244-mod.png',
    './assets/Pages/245-mod.png',
    './assets/Pages/246-mod.png',
    './assets/Pages/247-mod.png',
    './assets/Pages/248-mod.png',
    './assets/Pages/249-mod.png',
    './assets/Pages/250-mod.png',
    './assets/Pages/251-mod.png',
    './assets/Pages/252-mod.png',
    './assets/Pages/253-mod.png',
    './assets/Pages/254-mod.png',
    './assets/Pages/255-mod.png',
    './assets/Pages/256-mod.png',
    './assets/Pages/257-mod.png',
    './assets/Pages/258-mod.png',
    './assets/Pages/259-mod.png',
    './assets/Pages/260-mod.png',
    './assets/Pages/261-mod.png',
    './assets/Pages/262-mod.png',
    './assets/Pages/263-mod.png',
    './assets/Pages/264-mod.png',
    './assets/Pages/265-mod.png',
    './assets/Pages/266-mod.png',
    './assets/Pages/267-mod.png',
    './assets/Pages/268-mod.png',
    './assets/Pages/269-mod.png',
    './assets/Pages/270-mod.png',
    './assets/Pages/271-mod.png',
    './assets/Pages/272-mod.png',
    './assets/Pages/273-mod.png',
    './assets/Pages/274-mod.png',
    './assets/Pages/275-mod.png',
    './assets/Pages/276-mod.png',
    './assets/Pages/277-mod.png',
    './assets/Pages/278-mod.png',
    './assets/Pages/279-mod.png',
    './assets/Pages/280-mod.png',
    './assets/Pages/281-mod.png',
    './assets/Pages/282-mod.png',
    './assets/Pages/283-mod.png',
    './assets/Pages/284-mod.png',
    './assets/Pages/285-mod.png',
    './assets/Pages/286-mod.png',
    './assets/Pages/287-mod.png',
    './assets/Pages/288-mod.png',
    './assets/Pages/289-mod.png',
    './assets/Pages/290-mod.png',
    './assets/Pages/291-mod.png',
    './assets/Pages/292-mod.png',
    './assets/Pages/293-mod.png',
    './assets/Pages/294-mod.png',
    './assets/Pages/295-mod.png',
    './assets/Pages/296-mod.png',
    './assets/Pages/297-mod.png',
    './assets/Pages/298-mod.png',
    './assets/Pages/299-mod.png',
    './assets/Pages/300-mod.png',
    './assets/Pages/301-mod.png',
    './assets/Pages/302-mod.png',
    './assets/Pages/303-mod.png',
    './assets/Pages/304-mod.png',
    './assets/Pages/305-mod.png',
    './assets/Pages/306-mod.png',
    './assets/Pages/307-mod.png',
    './assets/Pages/308-mod.png',
    './assets/Pages/309-mod.png',
    './assets/Pages/310-mod.png',
    './assets/Pages/311-mod.png',
    './assets/Pages/312-mod.png',
    './assets/Pages/313-mod.png',
    './assets/Pages/314-mod.png',
    './assets/Pages/315-mod.png',
    './assets/Pages/316-mod.png',
    './assets/Pages/317-mod.png',
    './assets/Pages/318-mod.png',
    './assets/Pages/319-mod.png',
    './assets/Pages/320-mod.png',
    './assets/Pages/321-mod.png',
    './assets/Pages/322-mod.png',
    './assets/Pages/323-mod.png',
    './assets/Pages/324-mod.png',
    './assets/Pages/325-mod.png',
    './assets/Pages/326-mod.png',
    './assets/Pages/327-mod.png',
    './assets/Pages/328-mod.png',
    './assets/Pages/329-mod.png',
    './assets/Pages/330-mod.png',
    './assets/Pages/331-mod.png',
    './assets/Pages/332-mod.png',
    './assets/Pages/333-mod.png',
    './assets/Pages/334-mod.png',
    './assets/Pages/335-mod.png',
    './assets/Pages/336-mod.png',
    './assets/Pages/337-mod.png',
    './assets/Pages/338-mod.png',
    './assets/Pages/339-mod.png',
    './assets/Pages/340-mod.png',
    './assets/Pages/341-mod.png',
    './assets/Pages/342-mod.png',
    './assets/Pages/343-mod.png',
    './assets/Pages/344-mod.png',
    './assets/Pages/345-mod.png',
    './assets/Pages/346-mod.png',
    './assets/Pages/347-mod.png',
    './assets/Pages/348-mod.png',
    './assets/Pages/349-mod.png',
    './assets/Pages/350-mod.png',
    './assets/Pages/351-mod.png',
    './assets/Pages/352-mod.png',
    './assets/Pages/353-mod.png',
    './assets/Pages/354-mod.png',
    './assets/Pages/355-mod.png',
    './assets/Pages/356-mod.png',
    './assets/Pages/357-mod.png',
    './assets/Pages/358-mod.png',
    './assets/Pages/359-mod.png',
    './assets/Pages/360-mod.png',
    './assets/Pages/361-mod.png',
    './assets/Pages/362-mod.png',
    './assets/Pages/363-mod.png',
    './assets/Pages/364-mod.png',
    './assets/Pages/365-mod.png',
    './assets/Pages/366-mod.png',
    './assets/Pages/367-mod.png',
    './assets/Pages/368-mod.png',
    './assets/Pages/369-mod.png',
    './assets/Pages/370-mod.png',
    './assets/Pages/371-mod.png',
    './assets/Pages/372-mod.png',
    './assets/Pages/373-mod.png',
    './assets/Pages/374-mod.png',
    './assets/Pages/375-mod.png',
    './assets/Pages/376-mod.png',
    './assets/Pages/377-mod.png',
    './assets/Pages/378-mod.png',
    './assets/Pages/379-mod.png',
    './assets/Pages/380-mod.png',
    './assets/Pages/381-mod.png',
    './assets/Pages/382-mod.png',
    './assets/Pages/383-mod.png',
    './assets/Pages/384-mod.png',
    './assets/Pages/385-mod.png',
    './assets/Pages/386-mod.png',
    './assets/Pages/387-mod.png',
    './assets/Pages/388-mod.png',
    './assets/Pages/389-mod.png',
    './assets/Pages/390-mod.png',
    './assets/Pages/391-mod.png',
    './assets/Pages/392-mod.png',
    './assets/Pages/393-mod.png',
    './assets/Pages/394-mod.png',
    './assets/Pages/395-mod.png',
    './assets/Pages/396-mod.png',
    './assets/Pages/397-mod.png',
    './assets/Pages/398-mod.png',
    './assets/Pages/399-mod.png',
    './assets/Pages/400-mod.png',
    './assets/Pages/401-mod.png',
    './assets/Pages/402-mod.png',
    './assets/Pages/403-mod.png',
    './assets/Pages/404-mod.png',
    './assets/Pages/405-mod.png',
    './assets/Pages/406-mod.png',
    './assets/Pages/407-mod.png',
    './assets/Pages/408-mod.png',
    './assets/Pages/409-mod.png',
    './assets/Pages/410-mod.png',
    './assets/Pages/411-mod.png',
    './assets/Pages/412-mod.png',
    './assets/Pages/413-mod.png',
    './assets/Pages/414-mod.png',
    './assets/Pages/415-mod.png',
    './assets/Pages/416-mod.png',
    './assets/Pages/417-mod.png',
    './assets/Pages/418-mod.png',
    './assets/Pages/419-mod.png',
    './assets/Pages/420-mod.png',
    './assets/Pages/421-mod.png',
    './assets/Pages/422-mod.png',
    './assets/Pages/423-mod.png',
    './assets/Pages/424-mod.png',
    './assets/Pages/425-mod.png',
    './assets/Pages/426-mod.png',
    './assets/Pages/427-mod.png',
    './assets/Pages/428-mod.png',
    './assets/Pages/429-mod.png',
    './assets/Pages/430-mod.png',
    './assets/Pages/431-mod.png',
    './assets/Pages/432-mod.png',
    './assets/Pages/433-mod.png',
    './assets/Pages/434-mod.png',
    './assets/Pages/435-mod.png',
    './assets/Pages/436-mod.png',
    './assets/Pages/437-mod.png',
    './assets/Pages/438-mod.png',
    './assets/Pages/439-mod.png',
    './assets/Pages/440-mod.png',
    './assets/Pages/441-mod.png',
    './assets/Pages/442-mod.png',
    './assets/Pages/443-mod.png',
    './assets/Pages/444-mod.png',
    './assets/Pages/445-mod.png',
    './assets/Pages/446-mod.png',
    './assets/Pages/447-mod.png',
    './assets/Pages/448-mod.png',
    './assets/Pages/449-mod.png',
    './assets/Pages/450-mod.png',
    './assets/Pages/451-mod.png',
    './assets/Pages/452-mod.png',
    './assets/Pages/453-mod.png',
    './assets/Pages/454-mod.png',
    './assets/Pages/455-mod.png',
    './assets/Pages/456-mod.png',
    './assets/Pages/457-mod.png',
    './assets/Pages/458-mod.png',
    './assets/Pages/459-mod.png',
    './assets/Pages/460-mod.png',
    './assets/Pages/461-mod.png',
    './assets/Pages/462-mod.png',
    './assets/Pages/463-mod.png',
    './assets/Pages/464-mod.png',
    './assets/Pages/465-mod.png',
    './assets/Pages/466-mod.png',
    './assets/Pages/467-mod.png',
    './assets/Pages/468-mod.png',
    './assets/Pages/469-mod.png',
    './assets/Pages/470-mod.png',
    './assets/Pages/471-mod.png',
    './assets/Pages/472-mod.png',
    './assets/Pages/473-mod.png',
    './assets/Pages/474-mod.png',
    './assets/Pages/475-mod.png',
    './assets/Pages/476-mod.png',
    './assets/Pages/477-mod.png',
    './assets/Pages/478-mod.png',
    './assets/Pages/479-mod.png',
    './assets/Pages/480-mod.png',
    './assets/Pages/481-mod.png',
    './assets/Pages/482-mod.png',
    './assets/Pages/483-mod.png',
    './assets/Pages/484-mod.png',
    './assets/Pages/485-mod.png',
    './assets/Pages/486-mod.png',
    './assets/Pages/487-mod.png',
    './assets/Pages/488-mod.png',
    './assets/Pages/489-mod.png',
    './assets/Pages/490-mod.png',
    './assets/Pages/491-mod.png',
    './assets/Pages/492-mod.png',
    './assets/Pages/493-mod.png',
    './assets/Pages/494-mod.png',
    './assets/Pages/495-mod.png',
    './assets/Pages/496-mod.png',
    './assets/Pages/497-mod.png',
    './assets/Pages/498-mod.png',
    './assets/Pages/499-mod.png',
    './assets/Pages/500-mod.png',
    './assets/Pages/501-mod.png',
    './assets/Pages/502-mod.png',
    './assets/Pages/503-mod.png',
    './assets/Pages/504-mod.png',
    './assets/Pages/505-mod.png',
    './assets/Pages/506-mod.png',
    './assets/Pages/507-mod.png',
    './assets/Pages/508-mod.png',
    './assets/Pages/509-mod.png',
    './assets/Pages/510-mod.png',
    './assets/Pages/511-mod.png',
    './assets/Pages/512-mod.png',
    './assets/Pages/513-mod.png',
    './assets/Pages/514-mod.png',
    './assets/Pages/515-mod.png',
    './assets/Pages/516-mod.png',
    './assets/Pages/517-mod.png',
    './assets/Pages/518-mod.png',
    './assets/Pages/519-mod.png',
    './assets/Pages/520-mod.png',
    './assets/Pages/521-mod.png',
    './assets/Pages/522-mod.png',
    './assets/Pages/523-mod.png',
    './assets/Pages/524-mod.png',
    './assets/Pages/525-mod.png',
    './assets/Pages/526-mod.png',
    './assets/Pages/527-mod.png',
    './assets/Pages/528-mod.png',
    './assets/Pages/529-mod.png',
    './assets/Pages/530-mod.png',
    './assets/Pages/531-mod.png',
    './assets/Pages/532-mod.png',
    './assets/Pages/533-mod.png',
    './assets/Pages/534-mod.png',
    './assets/Pages/535-mod.png',
    './assets/Pages/536-mod.png',
    './assets/Pages/537-mod.png',
    './assets/Pages/538-mod.png',
    './assets/Pages/539-mod.png',
    './assets/Pages/540-mod.png',
    './assets/Pages/541-mod.png',
    './assets/Pages/542-mod.png',
    './assets/Pages/543-mod.png',
    './assets/Pages/544-mod.png',
    './assets/Pages/545-mod.png',
    './assets/Pages/546-mod.png',
    './assets/Pages/547-mod.png',
    './assets/Pages/548-mod.png',
    './assets/Pages/549-mod.png',
    './assets/Pages/550-mod.png',
    './assets/Pages/551-mod.png',
    './assets/Pages/552-mod.png',
    './assets/Pages/553-mod.png',
    './assets/Pages/554-mod.png',
    './assets/Pages/555-mod.png',
    './assets/Pages/556-mod.png',
    './assets/Pages/557-mod.png',
    './assets/Pages/558-mod.png',
    './assets/Pages/559-mod.png',
    './assets/Pages/560-mod.png',
    './assets/Pages/561-mod.png',
    './assets/Pages/562-mod.png',
    './assets/Pages/563-mod.png',
    './assets/Pages/564-mod.png',
    './assets/Pages/565-mod.png',
    './assets/Pages/566-mod.png',
    './assets/Pages/567-mod.png',
    './assets/Pages/568-mod.png',
    './assets/Pages/569-mod.png',
    './assets/Pages/570-mod.png',
    './assets/Pages/571-mod.png',
    './assets/Pages/572-mod.png',
    './assets/Pages/573-mod.png',
    './assets/Pages/574-mod.png',
    './assets/Pages/575-mod.png',
    './assets/Pages/576-mod.png',
    './assets/Pages/577-mod.png',
    './assets/Pages/578-mod.png',
    './assets/Pages/579-mod.png',
    './assets/Pages/580-mod.png',
    './assets/Pages/581-mod.png',
    './assets/Pages/582-mod.png',
    './assets/Pages/583-mod.png',
    './assets/Pages/584-mod.png',
    './assets/Pages/585-mod.png',
    './assets/Pages/586-mod.png',
    './assets/Pages/587-mod.png',
    './assets/Pages/588-mod.png',
    './assets/Pages/589-mod.png',
    './assets/Pages/590-mod.png',
    './assets/Pages/591-mod.png',
    './assets/Pages/592-mod.png',
    './assets/Pages/593-mod.png',
    './assets/Pages/594-mod.png',
    './assets/Pages/595-mod.png',
    './assets/Pages/596-mod.png',
    './assets/Pages/597-mod.png',
    './assets/Pages/598-mod.png',
    './assets/Pages/599-mod.png',
    './assets/Pages/600-mod.png',
    './assets/Pages/601-mod.png',
    './assets/Pages/602-mod.png',
    './assets/Pages/603-mod.png',
    './assets/Pages/604-mod.png'
  ];
  List<Widget> _listOfImages() {
    List<Widget> ImageCards = [];
    for (int i = 0; i < images.length; i++) {
      ImageCards.add(getImageWidget(i));
      if (i == 10) {
        break;
      }
    }
    return ImageCards;
  }

  List<Widget> _listOfImages2(int index) {
    List<Widget> ImageCards = [];
    int tempIndex = index + 10;
    for (int i = index + 1; i < tempIndex; i++) {
      ImageCards.add(getImageWidget(i));
      if (i == 10) {
        break;
      }
    }
    return ImageCards;
  }

  Future<void> setUiHighLightState(
      LongPressStartDetails details, int imageIndex) async {
    String coordinateText = "";
    await readData(imageIndex);
    try {
      coordinateText = getTextOfImageCoordinate(details.globalPosition)[4];
    } catch (ex) {
      print("-----------------------------------------------");
      print(ex);
    }

    if (coordinateText != "") {
      setState(() {
        _offset = details.globalPosition;
        check = true;
        flagImageMarker = imageIndex;
        debugPrint('status code: ${_offset}');
        coordinates = getTextOfImageCoordinate(details.globalPosition);
        //imageCard[imageIndex] = editInImage(counter:  imageIndex , editImageFlag: true ) ;
        imageCard[imageIndex] = getImageWidget(imageIndex);
        showAyaDialog(coordinateText);
      });
    }
  }

  void showAyaDialog(String text) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(text),
        content: Text(text),
      ),
    );
  }

  Widget getImageWidget(int i) => Material(
        child: Listener(
          child: GestureDetector(
            /*onTap: (){
          i == imageCard.length -1  ? setState(() {
            imageCard = _listOfImages2(10);
          }) : null ;
        },*/
            onTapUp: (details) async{
              await readData(i);
              coordinates = getTextOfImageCoordinate(details.globalPosition);
            },
            onLongPressStart: (details) async {
              //check = false ;
              await setUiHighLightState(details, i);
            },
            // onTap: (position) => yalla(position),
            // onInteractionUpdate: (v) async {
            // print("LoooooooooL");

            // },
            child: Stack(
              children: [
                Container(
                    width:MediaQuery.of(context).size.width ,
                    height:MediaQuery.of(context).size.height-30 ,
                    decoration:  BoxDecoration(
                      image:  DecorationImage(
                        image: ExactAssetImage(images[i]),
                        fit: BoxFit.fill,
                      ),
                    )),
                /*Center(
                  //heightFactor: double.infinity,
                  child: Image.asset(images[i] ),
                  //elevation: 10,
                  //Marker2(x: _offset.dx - 22 , y:  _offset.dy - 120  )
                ),*/
                check && flagImageMarker == i
                    ?
                    //Marker2(x: _offset.dx - 22 , y:  _offset.dy - 120  )
                    /*Positioned(
              top: _offset.dy - 120  ,
                left: _offset.dx - 22 ,
                child:Container(
                  color: Colors.red,
                  width: 50,
                ) )*/
                    Container()
                    : Container(),
              ],
            ),
          ),
        ),
      );
  editInImage({required int counter, required bool editImageFlag}) {
    imageCard[counter] = Material(
      child: Listener(
        child: GestureDetector(
          onTap: () {
            counter == imageCard.length - 1
                ? setState(() {
                    imageCard = _listOfImages2(10);
                  })
                : null;
          },
          onTapUp: (details) {
            coordinates = getTextOfImageCoordinate(details.globalPosition);
          },
          onLongPressStart: (details) {
            //check = false ;
            setState(() {
              _offset = details.globalPosition;
              check = true;
              flagImageMarker = counter;
              debugPrint('status code: ${_offset}');
              coordinates = getTextOfImageCoordinate(details.globalPosition);
              imageCard[counter] =
                  editInImage(counter: counter, editImageFlag: true);
              coordinates[4] != ""
                  ? showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text(coordinates[4]),
                            content: Text(coordinates[4]),
                          ))
                  : null;
            });
          },
          // onTap: (position) => yalla(position),
          // onInteractionUpdate: (v) async {
          // print("LoooooooooL");

          // },
          child: Stack(
            children: [
              Center(
                child: Image.asset(images[counter]),
                //elevation: 10,
                //Marker2(x: _offset.dx - 22 , y:  _offset.dy - 120  )
              ),
              check && flagImageMarker == counter
                  ? Marker2(x: _offset.dx + 15, y: _offset.dy - 110)
                  : Container(),
            ],
          ),
        ),
      ),
    );
    return imageCard[counter];
  }

  List<dynamic> getTextOfImageCoordinate(Offset position) {
    String ayaText = "";
    List<dynamic> coordinates = [];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double d1 = 914;
    double d2 = 1448;
    // print(width);
    // print(height);
    var heightR = width / d1;
    var widthR = height / d2;
    // print(widthR);
    // print(heightR);

    print("yallaaaaaaaaaaaaaaaaaaa");

    for (int i = 0; i < _ayasPage.length; i++) {
      var coordinate = _ayasPage[i].ayaCoordinates!.split(',');
      // print("-------------------");
      // print(coords.length);
      // print(coords);
      // print("-----------------");

      // Coords: X1, Y1, X2, Y2,... etc.
      for (int j = 0; j < coordinate.length - 1; j = j + 4) {
        print("INDEEEEX");
        print(j);

        // Check on X
        if (position.dx - 20.round() >= (int.parse(coordinate[j]) * heightR) &&
            position.dx - 20.round() <=
                (int.parse(coordinate[j + 2]) * heightR)) {
          //Check on Y
          if (position.dy-30.round() >=
                  (int.parse(coordinate[j + 1]) * widthR) &&
              position.dy - 50.round() <=
                  (int.parse(coordinate[j + 3]) * widthR)) {
            print(int.parse(coordinate[j + 1]) * widthR);
            print("L2EEETHAAAAAAAAAAAAAAAAAAAAA");
            print("Click--------------->");
            print(position.dx);
            print(position.dy);
            print("Cooooords--------->");
            print(coordinate);
            coordinates.add((int.parse(coordinate[j])));
            coordinates.add((int.parse(coordinate[j + 1])));
            coordinates.add((int.parse(coordinate[j + 2])));
            coordinates.add((int.parse(coordinate[j + 3])));
            coordinates.add(_ayasPage[i].ayaText);
            print(_ayasPage[i].ayaNumber);
            ayaText = _ayasPage[i].ayaText!;
            print(_ayasPage[i].ayaText);
            print("page coor ==> ");
            print("--------------------------------------------------");
            print(coordinates);
            print("--------------------------------------------------");
            print(
                "x1 : + ${position.dx} : ${(int.parse(coordinate[j]) * heightR)}");
            print(
                "y1 : + ${position.dy} :  ${(int.parse(coordinate[j + 1]) * widthR)}");
            print(
                "x2 : + ${position.dx} : ${(int.parse(coordinate[j + 2]) * heightR)}");
            print(
                "y2 : + ${position.dy} : ${(int.parse(coordinate[j + 3]) * widthR)}");

            flag = true;
            break;
          }
        }
      }
      if (flag == true) {
        flag = false;
        break;
      }
    }

    print("------------------------------------------------");

    //
    // print("--------------");
    // print(v.localFocalPoint.dx);
    // print(v.localFocalPoint.dy);
    // print("-------------");
    return coordinates;
  }

  Future<int> readData(int imageIndex) async {
    var out2 = await DBHelper.instance.readAllAyaInPage(imageIndex + 1);

    // print(out2);

    List<Aya> AyaList = convertToModel(out2!);

    setState(() {
      print(AyaList.length);
      _ayasPage = AyaList;
    });
    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData(widget.ind);
    // getAyasInPage(1);

    Future((){
      imageCard = _listOfImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    //imageCard=_listOfImages();
    //List <String> images = ['./assets/Pages/001-mod.png', './assets/Pages/002-mod.png', './assets/Pages/003-mod.png', './assets/Pages/004-mod.png', './assets/Pages/005-mod.png', './assets/Pages/006-mod.png', './assets/Pages/007-mod.png', './assets/Pages/008-mod.png', './assets/Pages/009-mod.png', './assets/Pages/010-mod.png', './assets/Pages/011-mod.png', './assets/Pages/012-mod.png', './assets/Pages/013-mod.png', './assets/Pages/014-mod.png', './assets/Pages/015-mod.png', './assets/Pages/016-mod.png', './assets/Pages/017-mod.png', './assets/Pages/018-mod.png', './assets/Pages/019-mod.png', './assets/Pages/020-mod.png', './assets/Pages/021-mod.png', './assets/Pages/022-mod.png', './assets/Pages/023-mod.png', './assets/Pages/024-mod.png', './assets/Pages/025-mod.png', './assets/Pages/026-mod.png', './assets/Pages/027-mod.png', './assets/Pages/028-mod.png', './assets/Pages/029-mod.png', './assets/Pages/030-mod.png', './assets/Pages/031-mod.png', './assets/Pages/032-mod.png', './assets/Pages/033-mod.png', './assets/Pages/034-mod.png', './assets/Pages/035-mod.png', './assets/Pages/036-mod.png', './assets/Pages/037-mod.png', './assets/Pages/038-mod.png', './assets/Pages/039-mod.png', './assets/Pages/040-mod.png', './assets/Pages/041-mod.png', './assets/Pages/042-mod.png', './assets/Pages/043-mod.png', './assets/Pages/044-mod.png', './assets/Pages/045-mod.png', './assets/Pages/046-mod.png', './assets/Pages/047-mod.png', './assets/Pages/048-mod.png', './assets/Pages/049-mod.png', './assets/Pages/050-mod.png', './assets/Pages/051-mod.png', './assets/Pages/052-mod.png', './assets/Pages/053-mod.png', './assets/Pages/054-mod.png', './assets/Pages/055-mod.png', './assets/Pages/056-mod.png', './assets/Pages/057-mod.png', './assets/Pages/058-mod.png', './assets/Pages/059-mod.png', './assets/Pages/060-mod.png', './assets/Pages/061-mod.png', './assets/Pages/062-mod.png', './assets/Pages/063-mod.png', './assets/Pages/064-mod.png', './assets/Pages/065-mod.png', './assets/Pages/066-mod.png', './assets/Pages/067-mod.png', './assets/Pages/068-mod.png', './assets/Pages/069-mod.png', './assets/Pages/070-mod.png', './assets/Pages/071-mod.png', './assets/Pages/072-mod.png', './assets/Pages/073-mod.png', './assets/Pages/074-mod.png', './assets/Pages/075-mod.png', './assets/Pages/076-mod.png', './assets/Pages/077-mod.png', './assets/Pages/078-mod.png', './assets/Pages/079-mod.png', './assets/Pages/080-mod.png', './assets/Pages/081-mod.png', './assets/Pages/082-mod.png', './assets/Pages/083-mod.png', './assets/Pages/084-mod.png', './assets/Pages/085-mod.png', './assets/Pages/086-mod.png', './assets/Pages/087-mod.png', './assets/Pages/088-mod.png', './assets/Pages/089-mod.png', './assets/Pages/090-mod.png', './assets/Pages/091-mod.png', './assets/Pages/092-mod.png', './assets/Pages/093-mod.png', './assets/Pages/094-mod.png', './assets/Pages/095-mod.png', './assets/Pages/096-mod.png', './assets/Pages/097-mod.png', './assets/Pages/098-mod.png', './assets/Pages/099-mod.png', './assets/Pages/100-mod.png', './assets/Pages/101-mod.png', './assets/Pages/102-mod.png', './assets/Pages/103-mod.png', './assets/Pages/104-mod.png', './assets/Pages/105-mod.png', './assets/Pages/106-mod.png', './assets/Pages/107-mod.png', './assets/Pages/108-mod.png', './assets/Pages/109-mod.png', './assets/Pages/110-mod.png', './assets/Pages/111-mod.png', './assets/Pages/112-mod.png', './assets/Pages/113-mod.png', './assets/Pages/114-mod.png', './assets/Pages/115-mod.png', './assets/Pages/116-mod.png', './assets/Pages/117-mod.png', './assets/Pages/118-mod.png', './assets/Pages/119-mod.png', './assets/Pages/120-mod.png', './assets/Pages/121-mod.png', './assets/Pages/122-mod.png', './assets/Pages/123-mod.png', './assets/Pages/124-mod.png', './assets/Pages/125-mod.png', './assets/Pages/126-mod.png', './assets/Pages/127-mod.png', './assets/Pages/128-mod.png', './assets/Pages/129-mod.png', './assets/Pages/130-mod.png', './assets/Pages/131-mod.png', './assets/Pages/132-mod.png', './assets/Pages/133-mod.png', './assets/Pages/134-mod.png', './assets/Pages/135-mod.png', './assets/Pages/136-mod.png', './assets/Pages/137-mod.png', './assets/Pages/138-mod.png', './assets/Pages/139-mod.png', './assets/Pages/140-mod.png', './assets/Pages/141-mod.png', './assets/Pages/142-mod.png', './assets/Pages/143-mod.png', './assets/Pages/144-mod.png', './assets/Pages/145-mod.png', './assets/Pages/146-mod.png', './assets/Pages/147-mod.png', './assets/Pages/148-mod.png', './assets/Pages/149-mod.png', './assets/Pages/150-mod.png', './assets/Pages/151-mod.png', './assets/Pages/152-mod.png', './assets/Pages/153-mod.png', './assets/Pages/154-mod.png', './assets/Pages/155-mod.png', './assets/Pages/156-mod.png', './assets/Pages/157-mod.png', './assets/Pages/158-mod.png', './assets/Pages/159-mod.png', './assets/Pages/160-mod.png', './assets/Pages/161-mod.png', './assets/Pages/162-mod.png', './assets/Pages/163-mod.png', './assets/Pages/164-mod.png', './assets/Pages/165-mod.png', './assets/Pages/166-mod.png', './assets/Pages/167-mod.png', './assets/Pages/168-mod.png', './assets/Pages/169-mod.png', './assets/Pages/170-mod.png', './assets/Pages/171-mod.png', './assets/Pages/172-mod.png', './assets/Pages/173-mod.png', './assets/Pages/174-mod.png', './assets/Pages/175-mod.png', './assets/Pages/176-mod.png', './assets/Pages/177-mod.png', './assets/Pages/178-mod.png', './assets/Pages/179-mod.png', './assets/Pages/180-mod.png', './assets/Pages/181-mod.png', './assets/Pages/182-mod.png', './assets/Pages/183-mod.png', './assets/Pages/184-mod.png', './assets/Pages/185-mod.png', './assets/Pages/186-mod.png', './assets/Pages/187-mod.png', './assets/Pages/188-mod.png', './assets/Pages/189-mod.png', './assets/Pages/190-mod.png', './assets/Pages/191-mod.png', './assets/Pages/192-mod.png', './assets/Pages/193-mod.png', './assets/Pages/194-mod.png', './assets/Pages/195-mod.png', './assets/Pages/196-mod.png', './assets/Pages/197-mod.png', './assets/Pages/198-mod.png', './assets/Pages/199-mod.png', './assets/Pages/200-mod.png', './assets/Pages/201-mod.png', './assets/Pages/202-mod.png', './assets/Pages/203-mod.png', './assets/Pages/204-mod.png', './assets/Pages/205-mod.png', './assets/Pages/206-mod.png', './assets/Pages/207-mod.png', './assets/Pages/208-mod.png', './assets/Pages/209-mod.png', './assets/Pages/210-mod.png', './assets/Pages/211-mod.png', './assets/Pages/212-mod.png', './assets/Pages/213-mod.png', './assets/Pages/214-mod.png', './assets/Pages/215-mod.png', './assets/Pages/216-mod.png', './assets/Pages/217-mod.png', './assets/Pages/218-mod.png', './assets/Pages/219-mod.png', './assets/Pages/220-mod.png', './assets/Pages/221-mod.png', './assets/Pages/222-mod.png', './assets/Pages/223-mod.png', './assets/Pages/224-mod.png', './assets/Pages/225-mod.png', './assets/Pages/226-mod.png', './assets/Pages/227-mod.png', './assets/Pages/228-mod.png', './assets/Pages/229-mod.png', './assets/Pages/230-mod.png', './assets/Pages/231-mod.png', './assets/Pages/232-mod.png', './assets/Pages/233-mod.png', './assets/Pages/234-mod.png', './assets/Pages/235-mod.png', './assets/Pages/236-mod.png', './assets/Pages/237-mod.png', './assets/Pages/238-mod.png', './assets/Pages/239-mod.png', './assets/Pages/240-mod.png', './assets/Pages/241-mod.png', './assets/Pages/242-mod.png', './assets/Pages/243-mod.png', './assets/Pages/244-mod.png', './assets/Pages/245-mod.png', './assets/Pages/246-mod.png', './assets/Pages/247-mod.png', './assets/Pages/248-mod.png', './assets/Pages/249-mod.png', './assets/Pages/250-mod.png', './assets/Pages/251-mod.png', './assets/Pages/252-mod.png', './assets/Pages/253-mod.png', './assets/Pages/254-mod.png', './assets/Pages/255-mod.png', './assets/Pages/256-mod.png', './assets/Pages/257-mod.png', './assets/Pages/258-mod.png', './assets/Pages/259-mod.png', './assets/Pages/260-mod.png', './assets/Pages/261-mod.png', './assets/Pages/262-mod.png', './assets/Pages/263-mod.png', './assets/Pages/264-mod.png', './assets/Pages/265-mod.png', './assets/Pages/266-mod.png', './assets/Pages/267-mod.png', './assets/Pages/268-mod.png', './assets/Pages/269-mod.png', './assets/Pages/270-mod.png', './assets/Pages/271-mod.png', './assets/Pages/272-mod.png', './assets/Pages/273-mod.png', './assets/Pages/274-mod.png', './assets/Pages/275-mod.png', './assets/Pages/276-mod.png', './assets/Pages/277-mod.png', './assets/Pages/278-mod.png', './assets/Pages/279-mod.png', './assets/Pages/280-mod.png', './assets/Pages/281-mod.png', './assets/Pages/282-mod.png', './assets/Pages/283-mod.png', './assets/Pages/284-mod.png', './assets/Pages/285-mod.png', './assets/Pages/286-mod.png', './assets/Pages/287-mod.png', './assets/Pages/288-mod.png', './assets/Pages/289-mod.png', './assets/Pages/290-mod.png', './assets/Pages/291-mod.png', './assets/Pages/292-mod.png', './assets/Pages/293-mod.png', './assets/Pages/294-mod.png', './assets/Pages/295-mod.png', './assets/Pages/296-mod.png', './assets/Pages/297-mod.png', './assets/Pages/298-mod.png', './assets/Pages/299-mod.png', './assets/Pages/300-mod.png', './assets/Pages/301-mod.png', './assets/Pages/302-mod.png', './assets/Pages/303-mod.png', './assets/Pages/304-mod.png', './assets/Pages/305-mod.png', './assets/Pages/306-mod.png', './assets/Pages/307-mod.png', './assets/Pages/308-mod.png', './assets/Pages/309-mod.png', './assets/Pages/310-mod.png', './assets/Pages/311-mod.png', './assets/Pages/312-mod.png', './assets/Pages/313-mod.png', './assets/Pages/314-mod.png', './assets/Pages/315-mod.png', './assets/Pages/316-mod.png', './assets/Pages/317-mod.png', './assets/Pages/318-mod.png', './assets/Pages/319-mod.png', './assets/Pages/320-mod.png', './assets/Pages/321-mod.png', './assets/Pages/322-mod.png', './assets/Pages/323-mod.png', './assets/Pages/324-mod.png', './assets/Pages/325-mod.png', './assets/Pages/326-mod.png', './assets/Pages/327-mod.png', './assets/Pages/328-mod.png', './assets/Pages/329-mod.png', './assets/Pages/330-mod.png', './assets/Pages/331-mod.png', './assets/Pages/332-mod.png', './assets/Pages/333-mod.png', './assets/Pages/334-mod.png', './assets/Pages/335-mod.png', './assets/Pages/336-mod.png', './assets/Pages/337-mod.png', './assets/Pages/338-mod.png', './assets/Pages/339-mod.png', './assets/Pages/340-mod.png', './assets/Pages/341-mod.png', './assets/Pages/342-mod.png', './assets/Pages/343-mod.png', './assets/Pages/344-mod.png', './assets/Pages/345-mod.png', './assets/Pages/346-mod.png', './assets/Pages/347-mod.png', './assets/Pages/348-mod.png', './assets/Pages/349-mod.png', './assets/Pages/350-mod.png', './assets/Pages/351-mod.png', './assets/Pages/352-mod.png', './assets/Pages/353-mod.png', './assets/Pages/354-mod.png', './assets/Pages/355-mod.png', './assets/Pages/356-mod.png', './assets/Pages/357-mod.png', './assets/Pages/358-mod.png', './assets/Pages/359-mod.png', './assets/Pages/360-mod.png', './assets/Pages/361-mod.png', './assets/Pages/362-mod.png', './assets/Pages/363-mod.png', './assets/Pages/364-mod.png', './assets/Pages/365-mod.png', './assets/Pages/366-mod.png', './assets/Pages/367-mod.png', './assets/Pages/368-mod.png', './assets/Pages/369-mod.png', './assets/Pages/370-mod.png', './assets/Pages/371-mod.png', './assets/Pages/372-mod.png', './assets/Pages/373-mod.png', './assets/Pages/374-mod.png', './assets/Pages/375-mod.png', './assets/Pages/376-mod.png', './assets/Pages/377-mod.png', './assets/Pages/378-mod.png', './assets/Pages/379-mod.png', './assets/Pages/380-mod.png', './assets/Pages/381-mod.png', './assets/Pages/382-mod.png', './assets/Pages/383-mod.png', './assets/Pages/384-mod.png', './assets/Pages/385-mod.png', './assets/Pages/386-mod.png', './assets/Pages/387-mod.png', './assets/Pages/388-mod.png', './assets/Pages/389-mod.png', './assets/Pages/390-mod.png', './assets/Pages/391-mod.png', './assets/Pages/392-mod.png', './assets/Pages/393-mod.png', './assets/Pages/394-mod.png', './assets/Pages/395-mod.png', './assets/Pages/396-mod.png', './assets/Pages/397-mod.png', './assets/Pages/398-mod.png', './assets/Pages/399-mod.png', './assets/Pages/400-mod.png', './assets/Pages/401-mod.png', './assets/Pages/402-mod.png', './assets/Pages/403-mod.png', './assets/Pages/404-mod.png', './assets/Pages/405-mod.png', './assets/Pages/406-mod.png', './assets/Pages/407-mod.png', './assets/Pages/408-mod.png', './assets/Pages/409-mod.png', './assets/Pages/410-mod.png', './assets/Pages/411-mod.png', './assets/Pages/412-mod.png', './assets/Pages/413-mod.png', './assets/Pages/414-mod.png', './assets/Pages/415-mod.png', './assets/Pages/416-mod.png', './assets/Pages/417-mod.png', './assets/Pages/418-mod.png', './assets/Pages/419-mod.png', './assets/Pages/420-mod.png', './assets/Pages/421-mod.png', './assets/Pages/422-mod.png', './assets/Pages/423-mod.png', './assets/Pages/424-mod.png', './assets/Pages/425-mod.png', './assets/Pages/426-mod.png', './assets/Pages/427-mod.png', './assets/Pages/428-mod.png', './assets/Pages/429-mod.png', './assets/Pages/430-mod.png', './assets/Pages/431-mod.png', './assets/Pages/432-mod.png', './assets/Pages/433-mod.png', './assets/Pages/434-mod.png', './assets/Pages/435-mod.png', './assets/Pages/436-mod.png', './assets/Pages/437-mod.png', './assets/Pages/438-mod.png', './assets/Pages/439-mod.png', './assets/Pages/440-mod.png', './assets/Pages/441-mod.png', './assets/Pages/442-mod.png', './assets/Pages/443-mod.png', './assets/Pages/444-mod.png', './assets/Pages/445-mod.png', './assets/Pages/446-mod.png', './assets/Pages/447-mod.png', './assets/Pages/448-mod.png', './assets/Pages/449-mod.png', './assets/Pages/450-mod.png', './assets/Pages/451-mod.png', './assets/Pages/452-mod.png', './assets/Pages/453-mod.png', './assets/Pages/454-mod.png', './assets/Pages/455-mod.png', './assets/Pages/456-mod.png', './assets/Pages/457-mod.png', './assets/Pages/458-mod.png', './assets/Pages/459-mod.png', './assets/Pages/460-mod.png', './assets/Pages/461-mod.png', './assets/Pages/462-mod.png', './assets/Pages/463-mod.png', './assets/Pages/464-mod.png', './assets/Pages/465-mod.png', './assets/Pages/466-mod.png', './assets/Pages/467-mod.png', './assets/Pages/468-mod.png', './assets/Pages/469-mod.png', './assets/Pages/470-mod.png', './assets/Pages/471-mod.png', './assets/Pages/472-mod.png', './assets/Pages/473-mod.png', './assets/Pages/474-mod.png', './assets/Pages/475-mod.png', './assets/Pages/476-mod.png', './assets/Pages/477-mod.png', './assets/Pages/478-mod.png', './assets/Pages/479-mod.png', './assets/Pages/480-mod.png', './assets/Pages/481-mod.png', './assets/Pages/482-mod.png', './assets/Pages/483-mod.png', './assets/Pages/484-mod.png', './assets/Pages/485-mod.png', './assets/Pages/486-mod.png', './assets/Pages/487-mod.png', './assets/Pages/488-mod.png', './assets/Pages/489-mod.png', './assets/Pages/490-mod.png', './assets/Pages/491-mod.png', './assets/Pages/492-mod.png', './assets/Pages/493-mod.png', './assets/Pages/494-mod.png', './assets/Pages/495-mod.png', './assets/Pages/496-mod.png', './assets/Pages/497-mod.png', './assets/Pages/498-mod.png', './assets/Pages/499-mod.png', './assets/Pages/500-mod.png', './assets/Pages/501-mod.png', './assets/Pages/502-mod.png', './assets/Pages/503-mod.png', './assets/Pages/504-mod.png', './assets/Pages/505-mod.png', './assets/Pages/506-mod.png', './assets/Pages/507-mod.png', './assets/Pages/508-mod.png', './assets/Pages/509-mod.png', './assets/Pages/510-mod.png', './assets/Pages/511-mod.png', './assets/Pages/512-mod.png', './assets/Pages/513-mod.png', './assets/Pages/514-mod.png', './assets/Pages/515-mod.png', './assets/Pages/516-mod.png', './assets/Pages/517-mod.png', './assets/Pages/518-mod.png', './assets/Pages/519-mod.png', './assets/Pages/520-mod.png', './assets/Pages/521-mod.png', './assets/Pages/522-mod.png', './assets/Pages/523-mod.png', './assets/Pages/524-mod.png', './assets/Pages/525-mod.png', './assets/Pages/526-mod.png', './assets/Pages/527-mod.png', './assets/Pages/528-mod.png', './assets/Pages/529-mod.png', './assets/Pages/530-mod.png', './assets/Pages/531-mod.png', './assets/Pages/532-mod.png', './assets/Pages/533-mod.png', './assets/Pages/534-mod.png', './assets/Pages/535-mod.png', './assets/Pages/536-mod.png', './assets/Pages/537-mod.png', './assets/Pages/538-mod.png', './assets/Pages/539-mod.png', './assets/Pages/540-mod.png', './assets/Pages/541-mod.png', './assets/Pages/542-mod.png', './assets/Pages/543-mod.png', './assets/Pages/544-mod.png', './assets/Pages/545-mod.png', './assets/Pages/546-mod.png', './assets/Pages/547-mod.png', './assets/Pages/548-mod.png', './assets/Pages/549-mod.png', './assets/Pages/550-mod.png', './assets/Pages/551-mod.png', './assets/Pages/552-mod.png', './assets/Pages/553-mod.png', './assets/Pages/554-mod.png', './assets/Pages/555-mod.png', './assets/Pages/556-mod.png', './assets/Pages/557-mod.png', './assets/Pages/558-mod.png', './assets/Pages/559-mod.png', './assets/Pages/560-mod.png', './assets/Pages/561-mod.png', './assets/Pages/562-mod.png', './assets/Pages/563-mod.png', './assets/Pages/564-mod.png', './assets/Pages/565-mod.png', './assets/Pages/566-mod.png', './assets/Pages/567-mod.png', './assets/Pages/568-mod.png', './assets/Pages/569-mod.png', './assets/Pages/570-mod.png', './assets/Pages/571-mod.png', './assets/Pages/572-mod.png', './assets/Pages/573-mod.png', './assets/Pages/574-mod.png', './assets/Pages/575-mod.png', './assets/Pages/576-mod.png', './assets/Pages/577-mod.png', './assets/Pages/578-mod.png', './assets/Pages/579-mod.png', './assets/Pages/580-mod.png', './assets/Pages/581-mod.png', './assets/Pages/582-mod.png', './assets/Pages/583-mod.png', './assets/Pages/584-mod.png', './assets/Pages/585-mod.png', './assets/Pages/586-mod.png', './assets/Pages/587-mod.png', './assets/Pages/588-mod.png', './assets/Pages/589-mod.png', './assets/Pages/590-mod.png', './assets/Pages/591-mod.png', './assets/Pages/592-mod.png', './assets/Pages/593-mod.png', './assets/Pages/594-mod.png', './assets/Pages/595-mod.png', './assets/Pages/596-mod.png', './assets/Pages/597-mod.png', './assets/Pages/598-mod.png', './assets/Pages/599-mod.png', './assets/Pages/600-mod.png', './assets/Pages/601-mod.png', './assets/Pages/602-mod.png', './assets/Pages/603-mod.png', './assets/Pages/604-mod.png'];
    return Scaffold(
        drawer: sideDrawer(),
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: const Color(0xFF94C2B6),
          actions: <Widget>[
            Container(
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text("المصحف  ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_sharp, color: Colors.black),
              //TODO: Navigate to previous page
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
          centerTitle: true,
        ),
        body: ListView.builder(
          //padding: EdgeInsets.all(20),
          physics: PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          //initialScrollIndex: widget.ind,
          itemCount: imageCard.length,
          itemBuilder: (context, index) {
            return imageCard[index];
          },
          controller: itemScrollController ,
          //itemScrollController: itemScrollController,
          //itemPositionsListener: itemPositionsListener,
        ));
  }


}

class Marker2 extends StatelessWidget {
  final double x;
  final double y;

  Marker2({Key? key, this.x = 0.0, this.y = 0.0}) : super(key: key) {
    //offset.dx.compareTo(offset.dx)
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(details.globalPosition.toString())));
  }

  @override
  Widget build(BuildContext context) {
    print("x: $x, y: $y");

    return Transform(
        transform: Matrix4.translationValues(x, y, 0.0), child: CircleAvatar());
  }
}
