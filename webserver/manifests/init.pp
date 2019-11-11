class webserver {
  notify { "Starting with the Webserver Installation":
  }
  include apache
  include index_file
  include port_change
}

