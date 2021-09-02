<?php
require_once ('dbhelp.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Inventory Receiving/Delivery Note</title>
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
				Quản lý thông tin phiếu xuất/nhập kho
				<form method="get">
					<input type="text" name="s" class="form-control" style="margin-top: 15px; margin-bottom: 15px;" placeholder="Tìm kiếm theo mã phiếu xuất/nhập">
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Full name</th>
							<th>Address</th>
							<th>Email</th>
                            <th>Phone number</th>
                            <th>User name</th>
                            <th>Password</th>
                            <th>Store ID</th>
							<th width="60px"></th>
							<th width="60px"></th>
						</tr>
					</thead>
					<tbody>
                        <?php
                        if (isset($_GET['s']) && $_GET['s'] != '') {
                            $sql = 'select * from inventoryreceivingdeliverynote where IDNote like "%'.$_GET['s'].'%"';
                        } else {
                            $sql = 'select * from inventoryreceivingdeliverynote';
                        }
                        $studentList = executeResult($sql);

                        foreach ($studentList as $std) {
                            echo '<tr>
                                    <td>'.$std['IDNote'].'</td>
                                    <td>'.$std['NameStaff'].'</td>
                                    <td>'.$std['Time'].'</td>
                                    <td>'.$std['StoreAddress'].'</td>
                                    <td>'.$std['NameOfBook'].'</td>
                                    <td>'.$std['IDOfBook'].'</td>
                                    <td>'.$std['AmountOfBook'].'</td>
									<td>'.$std['CurrentPriceOfBook'].'</td>
                                    <td>'.$std['IDIDStaff'].'</td>
									<td><button class="btn btn-warning" onclick=\'window.open("modifyinventoryreceivingdeliverynote.php?id='.$std['IDNote'].'","_self")\'>Edit</button></td>
									<td><button class="btn btn-danger" onclick="deleteidn('.$std['IDNote'].')">Delete</button></td>
                                </tr>';
                        }
                        ?>
					</tbody>
				</table>
				<button class="btn btn-success" onclick="window.open('addnewinventoryreceivingdeliverynote.php', '_self')">Add</button>
                <button class="btn btn-success" onclick="window.open('index.php', '_self')">Home page</button>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function deleteidn(id) {
			option = confirm('Bạn có muốn xoá hiệu sách này không')
			if(!option) {
				return;
			}

			console.log(id)
			$.post('deleteidn.php', {
				'id': id
			}, function(data) {
				alert(data)
				location.reload()
			})
		}
	</script>

</body>
</html>