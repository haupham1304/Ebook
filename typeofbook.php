<?php
require_once ('dbhelp.php');
?>
<!DOCTYPE html>
<html>
<head>
	<title>Type of Book</title>
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
				Quản lý thông tin các loại sách
				<form method="get">
					<input type="text" name="s" class="form-control" style="margin-top: 15px; margin-bottom: 15px;" placeholder="Tìm kiếm theo thể loại hoặc mã hiệu sách">
				</form>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Store ID</th>
                            <th>Book Type</th>
							<th width="60px"></th>
							<th width="60px"></th>
						</tr>
					</thead>
					<tbody>
                        <?php
                        if (isset($_GET['s']) && $_GET['s'] != '') {
                            $sql = 'select * from storagetypebook where TypeBook like "%'.$_GET['s'].'%" OR TIDStorage like "%'.$_GET['s'].'%"
									order by TIDStorage ASC';
                        } else {
                            $sql = 'select * from storagetypebook
									order by TIDStorage ASC';
                        }
                        $studentList = executeResult($sql);

                        foreach ($studentList as $std) {
                            echo '<tr>
                                    <td>'.$std['TIDStorage'].'</td>
									<td>'.$std['TypeBook'].'</td>
									<td><button class="btn btn-warning" onclick=\'window.open("modifytypeofbook.php?id='.$std['ID'].'","_self")\'>Edit</button></td>
									<td><button class="btn btn-danger" onclick="deletetob('.$std['ID'].')">Delete</button></td>
									</tr>';
                        }
                        ?>
					</tbody>
				</table>
				<button class="btn btn-success" onclick="window.open('addnewtypeofbook.php', '_self')">Add</button>
                <button class="btn btn-success" onclick="window.open('index.php', '_self')">Home page</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function deletetob(id) {
			option = confirm('Bạn có muốn xoá hiệu sách này không')
			if(!option) {
				return;
			}

			console.log(id)
			$.post('deletetob.php', {
				'id': id
			}, function(data) {
				alert(data)
				location.reload()
			})
		}
	</script>

</body>
</html>