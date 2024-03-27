class AppUrl {
  // the base url that use to other api and with mvvm provider
  static var baseUrl = 'http://159.89.207.207:3303/erp_system/api/v1/';
  //this the Customer url
  static var baseCustomerUrl = 'http://178.128.24.212:9876/mv_research/api/v1/';

  // the end point of the url to connect to any other product or endpoint
  static var loginUrl = '${baseUrl}auth/login';
  static var api_key = "api-key";
  static var api_value = "088k44s8gkwkg84owk0oscw40w0048k004g4okoo";
  static var checkin_checkout_url = '${baseUrl}attendance/check_in_check_out';
  static var getAllCustomer =
      '${baseCustomerUrl}customers?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo';
  static var getAllProducts =
      '${baseCustomerUrl}products?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo';

  //the end point of the url to connect to any other product for post
  static var insertCustomer =
      '${baseCustomerUrl}customers/add?api-key=4sowwscowwgs8cs800cswkkw44kw0wk84wsssooo&';
}
