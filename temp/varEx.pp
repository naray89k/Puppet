$myvar 			# valid
#$MyVar 		# invalid
$my_var 		# valid
#$my-var 		# invalid
#$_myvar 		# invalid
$my3numbers 	# valid
#$3numbers 		# invalid

$not_true = false 							# boolean
$num_tokens = 115 							# number
$my_name = 'Joe' 							# string
$my_list = [1,4,7] 							# items to an array
[$first,$last] = ['Jo','Rhett'] 			# array to array
$key_pairs = {name => 'Joe', uid => 1001} 	# hash


# New to Puppet 4, you can declare the data type of a variable at assignment.
Boolean $not_true = false
Integer $num_tokens = 115
String $my_name = 'Joe'
Array[Integer] $my_list = [1,4,7]
Array[String] [$first,$last] = ['Jo','Rhett']
Hash $key_pairs = {name => 'Joe', uid => 1001}


# Always quote numbers which may be misinterpreted, such as decimals with leading zeros.
$decimal = 1234 			# valid decimal assignment
$octal = 0775 				# valid octal assignment
$hexadecimal = 0xFFAA 		# valid hexadecimal assignment
$string = '001234' 			# decimal number with leading zeros


# Strings with pure data should be surrounded by single quotes.
$my_name = 'Dr. Evil'
$how_much = '100 million'

# Use double quotes when interpolating variables into strings, as shown in the example below.
$the_greeting = "${my_name}, you've been given ${how_much} dollars!\n"


# Using the correct quotes avoids difficult situations with input data.
$num_tokens = '100 million $ dollars' # US dollars, not a variable to be evaluated

# As with most scripting languages, curly brackets should be used to delineate variable boundaries.
$the_greeting = "Hello ${myname}, you've been given ${num_tokens} tokens!\n"
notice { 'value2':
	message => "The second value in the list=${my_list[1]}\n",
}


# Use curly brackets any time you use a variable within a string, but not when using the
# variable by itself. As shown below, the variable is used by itself in the resource, so it
# reads easier without the brackets.

# This time we define the strings in advance
$file_name = "/tmp/testfile2-${my_name}.txt"
$the_greeting = "Hello ${myname}, you've been given ${num_tokens} tokens!\n"
# Don't use brackets for variables that stand alone
file { $file_name:
	ensure => present,
	mode => '0644',
	replace => true,
	contents => $the_greeting,
}


# Strings should be surrounded by single quotes. Use double quotes when interpolating
# variables into strings, as shown in the example below.
notice( 'Beginning the program.' )
notice( "Hello ${myname}, glad to see you today!" )


# You can access specific values within an Array or Hash by using the index or key
# respectively.
notice( "The second value in my list is ${my_list[1]}" )
notice( "The name in my key pair hash is $key_pair{'name'}" )


# Don't use quotes or brackets around variables that stand alone
file { $file_name:
	ensure => present,
	mode => '0644',
	replace => true,
	contents => $the_greeting,
}


# The facts provided by Facter can be referenced like any other variable. The facts are
# available in a $facts array. For example, to customize the message shown on login to
# each node, use a File resource like this.
file { '/etc/motd':
	ensure => present,
	mode => '0644',
	replace => true,
	contents => "Host ${facts['hostname']}, running ${facts['os']['release']['full']}\n",
}



# You can use all standard arithmetic operators for variable assignment or evaluation.
# As before, we’re going to provide examples and skip an explanation you’ve likely
# learned many times in your life.
$added = 10 + 5 # 15
$subtracted = 10 - 5 # 5
$multiplied = 10 * 5 # 50
$divided = 10 / 5 # 2
$remainder = 10 % 5 # 0
$two_bits_l = 2 << 2 # 8
$two_bits_r = 64 >> 2 # 16


# New in Puppet 4, you can concatenate arrays and merge hashes with +. You might
# remember these structured data types we defined in the previous section:
$my_list = [1,4,7]
$bigger_list = $my_list + [14,17] 				# equals [1,4,7,14,17]
$key_pairs = {name => 'Joe', uid => 1001}
$user_definition = $key_pairs + { gid => 500 } 	# hash now has name, uid, gid...


# You can append to arrays with the << operator. Watch out though, as an array
# appended to an array creates a single entry in the array containing an array in the last
# position.
$my_list << 33 		# equals [1,4,7,33]
$my_list << [33,35] # equals [1,4,7,[33,35]]


# You can also get the difference between two hashes with the - operator.
$hash_one = {name => 'Jo', uid => 1001, gid => 500 }
$hash_two = {name => 'Jo', uid => 1001, home => '/home/jo' }
$difference = $hash_one - $hash_two # hash with gid and home directory
