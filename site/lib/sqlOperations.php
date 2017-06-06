<?php
/**
 * Opretter en bruger i databasen
 *
 * @param string $sql
 * @param array $data
 * @return boolean
 */
	function sqlQueryPrepared($sql, $data) {
		global $conn;
		$stmt = $conn->prepare($sql);
		return $stmt->execute($data);
	}
	function sqlQueryAssoc($sql, $data = []){
		global $conn;
		$stmt = $conn->prepare($sql);
		if($stmt->execute($data)){
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}
	}