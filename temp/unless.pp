unless( $facts['id'] == 'root' ) {
  notify { 'needsroot':
    message => "This manifest must be executed as root.",
  }
}
#else {
#  notify { 'isroot':
#    message => "Running as root.",
#  }
#}
