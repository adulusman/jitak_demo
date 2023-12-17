import 'package:flutter/material.dart';

customTxtReq(final String txt) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Text(txt),
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    ),
  );
}

customTxtReqWithEx(final String txt, String txt2) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Text(txt),
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            txt2,
            style: const TextStyle(color: Color(0xff9C9896)),
          )
        ],
      ),
    ),
  );
}

customListImage(List listName) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8),
    child: SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: 91,
                  width: 91,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(listName[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const Positioned(
                  right: 2,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        },
      ),
    ),
  );
}
