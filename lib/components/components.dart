// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/modules/web_view/web_view.dart';


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onchange,
  required validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,

}) => TextFormField(
  validator: validate,
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onChanged: (String value){
    onchange(value);
  },
  decoration:  InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: IconButton(
      onPressed: (){
        suffixPressed!();
      },
      icon: Icon(
        suffix,
      ),
    ),
  ),
);



Widget buildArticleItem(article) {
  return article.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebViewScreen(url: article[index]['url'])),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        image: DecorationImage(
                          image: NetworkImage('${article[index]['urlToImage']}'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              article[index]['title'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Text(
                            article[index]['publishedAt'],
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
          ),
          itemCount: article.length,
        );
}
