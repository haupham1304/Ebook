<?php
require_once ('dbhelp.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Contact</title>
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
				Quản lý thông tin liên lạc với tác giả
				<form method="get">
					<input type="text" name="s" class="form-control" style="margin-top: 15px; margin-bottom: 15px;" placeholder="Tìm kiếm theo mã nhân viên hoặc mã tác giả">
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Author ID</th>
                            <th>Staff ID</th>
							<th width="60px"></th>
						</tr>
					</thead>
					<tbody>
                        <?php
                        if (isset($_GET['s']) && $_GET['s'] != '') {
                            $sql = 'select * from contact where CIDAuthor like "%'.$_GET['s'].'%" OR CIDStaff like "%'.$_GET['s'].'%"
									order by CIDAuthor ASC';
                        } else {
                            $sql = 'select * from contact
									order by CIDAuthor ASC';
                        }
                        $studentList = executeResult($sql);

                        foreach ($studentList as $std) {
                            echo '<tr>
                                    <td>'.$std['CIDAuthor'].'</td>
                                    <td>'.$std['CIDStaff'].'</td>
									<td><button class="btn btn-danger" onclick="deleteContact('.$std['ID'].')">Delete</button></td>
                                </tr>';
                        }
                        ?>
					</tbody>
				</table>
				<button class="btn btn-success" onclick="window.open('addnewcontact.php', '_self')">Add</button>
                <button class="btn btn-success" onclick="window.open('index.php', '_self')">Home page</button>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function deleteContact(id) {
			option = confirm('Bạn có muốn xoá hiệu sách này không')
			if(!option) {
				return;
			}

			console.log(id)
			$.post('deletecontact.php', {
				'id': id
			}, function(data) {
				alert(data)
				location.reload()
			})
		}
	</script>

</body>
</html>