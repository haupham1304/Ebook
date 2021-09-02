<?php
if (isset($_POST['id'])) {
	$id = $_POST['id'];

	require_once ('dbhelp.php');
	$sql = 'delete from contact where ID = '.$id;
	execute($sql);

	echo 'Xoá liên lạc thành công';
}