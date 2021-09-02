<?php
if (isset($_POST['id'])) {
	$id = $_POST['id'];

	require_once ('dbhelp.php');
	$sql = 'delete from storagetypebook where ID = '.$id;
	execute($sql);

	echo 'Xoá phiếu xuất/nhập thành công';
}