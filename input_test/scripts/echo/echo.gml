/// echo(item1 [,item2 [,..]])
/// @param item1
/// @param [item2...]
function echo() {

	var echo_item;
	var echo_string="";
	for(echo_item=0;echo_item<argument_count;echo_item++){
		echo_string+=string(argument[echo_item])+" ";
	}

	var final_string = object_get_name(object_index) + "|" + string(get_timer()/10000) + "| " + echo_string;
	show_debug_message(final_string)

	if (debug_mode && os_type == os_macosx) || (os_type == os_uwp){
		var fh = file_text_open_append("console.log");
		file_text_write_string(fh,final_string);
		file_text_writeln(fh);
		file_text_close(fh);
	}


}
