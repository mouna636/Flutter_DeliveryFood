class UnboardingContent{
  String image;
  String title;
  String description;
  UnboardingContent({required this.image,required this.title,required this.description});
  
}
List<UnboardingContent> contents=[
  UnboardingContent(image: "images/screen1.png", 
  title: 'Select from our\n  Best menu', 
  description: 'pick your food from our menu\n   more than 35 times'),
   
   UnboardingContent(image: "images/screen3.png", 
  title: 'Quick delivery at your Doorstep', 
  description: 'Deliver your food at your\n  Doorstep')
];