<?php
require_once ('dbhelp.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Staff and I/D Note</title>
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
				Hiển thị thông tin nhân viên đã nhập/xuất các cuốn sách
				<form method="get">
					<input type="text" name="s" class="form-control" style="margin-top: 15px; margin-bottom: 15px;" placeholder="Tìm kiếm theo tên sách">
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Full name</th>
							<th>Email</th>
                            <th>Phone number</th>
                            <th>Time</th>
                            <th>Note ID</th>
                            <th>Book Name</th>
                            <th>Book ID</th>
						</tr>
					</thead>
					<tbody>
                        <?php
                        if (isset($_GET['s']) && $_GET['s'] != '') {
                            $sql = 'SELECT staff.IDStaff, inventoryreceivingdeliverynote.NameStaff, staff.EmailStaff, staff.PhoneStaff, inventoryreceivingdeliverynote.Time, inventoryreceivingdeliverynote.IDNote, inventoryreceivingdeliverynote.NameOfBook, inventoryreceivingdeliverynote.IDOfBook
                                    FROM ebook.staff, ebook.inventoryreceivingdeliverynote
                                    WHERE staff.IDStaff = inventoryreceivingdeliverynote.IDIDStaff AND inventoryreceivingdeliverynote.NameOfBook like "%'.$_GET['s'].'%"
                                    ORDER BY staff.IDStaff ASC';
                        } else {
                            $sql = 'SELECT staff.IDStaff, inventoryreceivingdeliverynote.NameStaff, staff.EmailStaff, staff.PhoneStaff, inventoryreceivingdeliverynote.Time, inventoryreceivingdeliverynote.IDNote, inventoryreceivingdeliverynote.NameOfBook, inventoryreceivingdeliverynote.IDOfBook
                                    FROM ebook.staff, ebook.inventoryreceivingdeliverynote
                                    WHERE staff.IDStaff = inventoryreceivingdeliverynote.IDIDStaff
                                    ORDER BY staff.IDStaff ASC';
                        }
                        $studentList = executeResult($sql);

                        foreach ($studentList as $std) {
                            echo '<tr>
                                    <td>'.$std['IDStaff'].'</td>
                                    <td>'.$std['NameStaff'].'</td>
                                    <td>'.$std['EmailStaff'].'</td>
                                    <td>'.$std['PhoneStaff'].'</td>
                                    <td>'.$std['Time'].'</td>
                                    <td>'.$std['IDNote'].'</td>
                                    <td>'.$std['NameOfBook'].'</td>
                                    <td>'.$std['IDOfBook'].'</td>
                                </tr>';
                        }
                        ?>
					</tbody>
				</table>
                <button class="btn btn-success" onclick="window.open('index.php', '_self')">Home page</button>
			</div>
		</div>
	</div>
</body>
</html>