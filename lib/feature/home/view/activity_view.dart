import 'package:exercise/product/extension/context/size.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  int selectedIndex = 0; // Default selected index
  final categories = [
    'Seminars',
    'Events',
    'Volunteering',
    'Coding'
  ]; // Categories

  // Assuming you have a list of news data
  List<Map<String, dynamic>> newsList = [
    {
      'category': 'Category 1',
      'date': 'Date 1',
      'name': 'News 1',
      'avatar': 'assets/images/avatar1.png', // Replace with your asset path
    },
    // Add more news data here
    {
      'category': 'Category 1',
      'date': 'Date 1',
      'name': 'News 1',
      'avatar': 'assets/images/avatar1.png', // Replace with your asset path
    },
    {
      'category': 'Category 1',
      'date': 'Date 1',
      'name': 'News 1',
      'avatar': 'assets/images/avatar1.png', // Replace with your asset path
    },
    {
      'category': 'Category 1',
      'date': 'Date 1',
      'name': 'News 1',
      'avatar': 'assets/images/avatar1.png', // Replace with your asset path
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //* TOP BAR
            // Activities around you text and search icon
            // Container with 3 icons
            Container(
              padding: EdgeInsets.all(context.sized.width * 0.05),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          //? lightining icon
                          Icon(
                            Icons.flash_on_outlined,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          Text(
                            "Activities around you",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Explore local events and activities nearby.",
                        // information text, style
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  //? search icon
                  const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ],
              ),
            ),

            //* FEST SCROLLVIEW CARDS
            Container(
              padding: EdgeInsets.only(
                left: context.sized.width * 0.05,
                top: context.sized.width * 0.02,
                bottom: context.sized.width * 0.02,
              ),
              height: context.sized.height * 0.2,
              // Set the height of the container
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5, // The number of items in the list
                itemBuilder: (BuildContext context, int index) {
                  // Return the widget based on the item index
                  return Container(
                    width: context.sized.width * 0.85,
                    height: context.sized.height * 0.18,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                      // border color all
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                //? FEST ICON
                                const Icon(
                                  Icons.pin_drop,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: context.sized.height * 0.01),
                                //? FEST NAME
                                const Flexible(
                                  child: Text(
                                    "FEST NAME.",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            // divider
                            Padding(
                              padding: EdgeInsets.only(
                                  left: context.sized.width * 0.1),
                              child: const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            // Row with icon leading and text name of fest and under text with date and time
                            Padding(
                              padding: EdgeInsets.only(
                                  left: context.sized.width * 0.1),
                              child: Row(
                                children: [
                                  //? CALENDAR ICON
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 30,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: context.sized.height * 0.01),
                                  //? FEST DATE AND TIME
                                  const Flexible(
                                    flex: 2,
                                    child: Text.rich(
                                      TextSpan(
                                        text: "Place name",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "\nFest time",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // 3 random circle avatar with image
                                  SizedBox(width: context.sized.height * 0.01),
                                  // //? CIRCLE AVATAR
                                  // list view builder for random 3 circle avatar
                                  SizedBox(
                                    // width: context.sized.width * 0.2,
                                    height: context.sized.height * 0.05,
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: 3,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return const CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  // You can adjust the size and color of the separator as needed
                  return const SizedBox(width: 10);
                },
              ),
            ),
            SizedBox(height: context.sized.height * 0.02),

            // SCROLL HORIZONTAL CARDS
            //* EXPLORE
            // EXPLORE TEXT and > icon
            Padding(
              padding: EdgeInsets.only(left: context.sized.width * 0.05),
              child: Row(
                children: [
                  const Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: context.sized.width * 0.05),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ),
            // SizedBox(height: context.sized.height * 0.04),
            SizedBox(
              height: context.sized.height * 0.08,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      avatar: null,
                      // circular
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: Text(
                        categories[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: selectedIndex == index,
                      onSelected: (selected) {
                        if (selected) {
                          // Update the state in a stateful widget
                          setState(() {
                            selectedIndex = index;
                          });
                        }
                      },
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.white,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: context.sized.height * 0.02),
            // THIS WEEK text with greey color
            Padding(
              padding: EdgeInsets.only(left: context.sized.width * 0.05),
              child: Row(
                children: [
                  Text(
                    "THIS WEEK",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),

            // EXPANDED LISTVIEW FOR LISTING NEWS => FIRST LINE CATEGORIE - DATE SECOND LINE NAME OF NEWS - END OF ROW CIRCLE AVATAR FOR NEW
            Expanded(
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '${newsList[index]['category']} . ', // Replace with your category
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextSpan(
                            text:
                                '${newsList[index]['date']}', // Replace with your date
                            style: DefaultTextStyle.of(context)
                                .style
                                .copyWith(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      newsList[index]['name'],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: SizedBox(
                      width: context.sized.width * 0.2,
                      height: context.sized.height * 0.085,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2965/2965879.png'),
                    ),
                    //  const CircleAvatar(
                    //   radius: 30,
                    //   // BACKGROUND IMAGE FROM NETWORK IMAGE URL
                    //   backgroundImage: NetworkImage(
                    //       'https://cdn-icons-png.flaticon.com/512/2965/2965879.png'),
                    // ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
