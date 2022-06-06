class ApiConstants {
  static String baseUrl = "https://jsonplaceholder.typicode.com";
  static String usersEndPoint = "/users";
  static String postsEndPoint = "/posts";
  static String commentsEndPoint = "/comments";
  static String albumsEndPoint = "/albums";
  static String photosEndPoint = "/photos";
  static String todosEndPoint = "/todos";

//? why static fields ?
// Here, we have created a class called ApiConstants and two static
//variables so that we can access them without creating an instance
//of the class like ApiConstants.baseUrl.

}


// Resources
// JSONPlaceholder comes with a set of 6 common resources:

// /posts	100 posts
// /comments	500 comments
// /albums	100 albums
// /photos	5000 photos
// /todos	200 todos
// /users	10 users
