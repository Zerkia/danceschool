<?php

	class Lommeregner{
		public $x;
		public $y;
		public $resultat;
		public function plus($x, $y){
			$this->x = $x;
			$this->y = $y;
			$this->resultat = $x + $y;
			return $this->resultat;
		}
	}

	$lommeregner = new Lommeregner();
	$lommeregner2 = new Lommeregner();
	$lommeregner->plus(99, 8929);
	$lommeregner2->plus(700, 928929);
	echo $lommeregner->x . ' + ' . $lommeregner->y . ' = ' . $lommeregner->resultat . '<br />';
	echo $lommeregner2->x . ' + ' . $lommeregner2->y . ' = ' . $lommeregner2->resultat . '<br />';