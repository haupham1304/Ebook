<?php
require_once ('dbhelp.php');
	$s_id = $s_sname = $s_time = $s_address = $s_bname = $s_bid = $s_ammount = $s_price = $s_sid = '';

	if (!empty($_POST)) {

		$error = array();

    	$sql = 'select * from staff where IDStaff =' .$_POST['sid'];
    	$staffList = executeResult($sql);
    	if ($staffList == NULL) {
        	$error['IDstaff'] = "Mã nhân viên bạn chọn không tồn tại trên hệ thống";
        	echo '<script type="text/javascript">alert("Mã nhân viên bạn chọn không tồn tại trên hệ thống")</script>';
    	}
		
		if (isset($_POST['nid'])) {
			$s_id = $_POST['nid'];
		}
	
		if (isset($_POST['sname'])) {
			$s_sname = $_POST['sname'];
		}
	
		if (isset($_POST['time'])) {
			$s_time = $_POST['time'];
		}
	
		if (isset($_POST['address'])) {
			$s_address = $_POST['address'];
		}
	
		if (isset($_POST['bname'])) {
			$s_bname = $_POST['bname'];
		}
	
		if (isset($_POST['bid'])) {
			$s_bid = $_POST['bid'];
		}
	
		if (isset($_POST['ammount'])) {
			$s_ammount = $_POST['ammount'];
		}
	
		if (isset($_POST['price'])) {
			$s_price = $_POST['price'];
		}
	
		if (isset($_POST['sid'])) {
			$s_sid = $_POST['sid'];
		}
		
		$s_id       = str_replace('\'', '\\\'', $s_id);
		$s_sname    = str_replace('\'', '\\\'', $s_sname);
		$s_time     = str_replace('\'', '\\\'', $s_time);
		$s_address  = str_replace('\'', '\\\'', $s_address);
		$s_bname    = str_replace('\'', '\\\'', $s_bname);
		$s_bid      = str_replace('\'', '\\\'', $s_bid);
		$s_ammount  = str_replace('\'', '\\\'', $s_ammount);
		$s_price    = str_replace('\'', '\\\'', $s_price);
		$s_sid      = str_replace('\'', '\\\'', $s_sid);

		if (empty($error)) {
			$sql = "update inventoryreceivingdeliverynote set NameStaff = '$s_sname', Time = '$s_time', StoreAddress = '$s_address', NameOfBook = '$s_bname', IDOfBook = '$s_bid', AmountOfBook = '$s_ammount', CurrentPriceOfBook = '$s_price', IDIDStaff = '$s_sid' where IDNote = " .$s_id;
			execute($sql);
			header('Location: inventoryreceivingdeliverynote.php');
			die();
		}
	
	}

	$id = '';
	if (isset($_GET['id'])) {
		$id          = $_GET['id'];
		$sql         = 'select * from inventoryreceivingdeliverynote where IDNote = '.$id;
		$idnList   = executeResult($sql);
		if ($idnList != null) {
			$std         = $idnList[0];
			$ss_sname    = $std['NameStaff'];
			$ss_time	 = $std['Time'];
			$ss_address  = $std['StoreAddress'];
			$ss_bname    = $std['NameOfBook'];
			$ss_bid      = $std['IDOfBook'];
			$ss_ammount  = $std['AmountOfBook'];
			$ss_price    = $std['CurrentPriceOfBook'];
			$ss_sid      = $std['IDIDStaff'];
		} else {
			$id = '';
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Modify I/D Note</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2 class="text-center">Chỉnh sửa dữ liệu phiếu nhập xuất</h2>
			</div>
			<div class="panel-body">
				<form method="post">
					<div class="form-group">
					  <label for="mnv">Note ID:</label> <?php echo $id;?>
					  <input style="display: none;" type="text" class="form-control" id="mnv" name="nid" value="<?=$id?>">
					</div>
					<div class="form-group">
					  <label for="fn">Staff name:</label>
					  <input required="true" type="text" class="form-control" id="fn" name="sname" value="<?=$ss_sname?>">
					</div>
                    <div class="form-group">
					  <label for="pass">Staff ID:</label>
					  <input required="true" type="text" class="form-control" id="pass" name="sid" value="<?=$ss_sid?>">
					</div>
					<div class="form-group">
					  <label for="mn">Time:</label>
					  <input required="true" type="datetime" class="form-control" id="mn" name="time" value="<?=$ss_time?>">
					</div>
					<div class="form-group">
					  <label for="ln">Store address:</label>
					  <input required="true" type="text" class="form-control" id="ln" name="address" value="<?=$ss_address?>">
					</div>
					<div class="form-group">
					  <label for="address">Book ID:</label>
					  <input required="true" type="text" class="form-control" id="address" name="bid" value="<?=$ss_bid?>">
					</div>
					<div class="form-group">
					  <label for="email">Book name:</label>
					  <input required="true" type="text" class="form-control" id="email" name="bname" value="<?=$ss_bname?>">
					</div>
					<div class="form-group">
					  <label for="phone">Book ammount:</label>
					  <input required="true" type="text" class="form-control" id="phone" name="ammount" value="<?=$ss_ammount?>">
					</div>
					<div class="form-group">
					  <label for="user">Book Price:</label>
					  <input required="true" type="text" class="form-control" id="user" name="price" value="<?=$ss_price?>">
					</div>
					<button class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>