enum Routes {
  // The login page.
  login('/login', 'login'),

  // The home page.
  home('/', 'home'),

  // The remote page.
  remote('/remote', 'remote');

  const Routes(this.path, this.name);

  // The route's name.
  final String name;

  // The route's path.
  final String path;
}
