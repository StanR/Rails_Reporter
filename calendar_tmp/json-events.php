<?php

	$year = date('Y');
	$month = date('m');

	echo json_encode(array(
	
		array(
			'id' => 111,
			'title' => "Event1",
			'start' => "$year-$month-10",
			'url' => "http://yahoo.com/"
		),
		
		array(
			'id' => 222,
			'title' => "Event2",
			'start' => "2012-$month-10",
			'end' => "2012-$month-10",
			'url' => "http://yahoo.com/"
		),array(
			'id' => 3,
			'title' => "Event2",
			'start' => "2012-$month-10",
			'end' => "2012-$month-10",
			'url' => "http://yahoo.com/"
		),array(
			'id' => 22222,
			'title' => "Event2",
			'start' => "2012-$month-10",
			'end' => "2012-$month-10",
			'url' => "http://yahoo.com/"
		),
		array(
			'id' => 4,
			'title' => "Event2",
			'start' => "2012-$month-10",
			'end' => "2012-$month-10",
			'url' => "http://yahoo.com/"
		),
		array(
			'id' => 6,
			'title' => "Event2",
			'start' => "2012-$month-10",
			'end' => "2012-$month-10",
			'url' => "http://yahoo.com/"
		),
		array(
			'id' => 7,
			'title' => "Event2",
			'start' => "2012-$month-10",
			'end' => "2012-$month-10",
			'url' => "http://yahoo.com/"
		),
	
	
	));

?>
