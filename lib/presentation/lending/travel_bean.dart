// TODO Implement this library.class TravelBean {
  class TravelBean {
  String name;
  String location;
  String url;

  TravelBean(this.name, this.location, this.url);

  static List<TravelBean> generateTravelBean() {
    return [
      TravelBean("Peach", "Spain ES1", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Grassland", "Spain ES2", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Starry sky", "Spain ES3", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Beauty Pic", "Spain ES4", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Peach", "Spain ES1", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Grassland", "Spain ES2", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Starry sky", "Spain ES3", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Beauty Pic", "Spain ES4", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
    ];
  }

  static List<TravelBean> generateMostPopularBean() {
    return [
      TravelBean("Peach", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Grassland", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Starry sky", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Beauty Pic", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
        TravelBean("Peach", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Grassland", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Starry sky", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
      TravelBean("Beauty Pic", "Spain ES", "https://images.pexels.com/photos/5811883/pexels-photo-5811883.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
    ];
  }
}
