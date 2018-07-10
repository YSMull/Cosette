#lang rosette 
 
(require "../cosette.rkt" "../util.rkt" "../denotation.rkt" "../cosette.rkt" "../sql.rkt" "../evaluator.rkt" "../syntax.rkt" "../symmetry.rkt" "../test-util.rkt") 
  

(provide ros-instance)  

(current-bitwidth #f)

(define t0 (table-info "input" (list "id_order" "id_product")))
 
(define (q5 tables) 
(AS (SELECT (VALS "t2.id_product" (VAL-UNOP aggr-count (val-column-ref "t2.id_order")) )
 FROM (AS (SELECT (VALS "t5.id_order" "t5.id_product" "t5.id_order1" "t5.id_product1" )
 FROM (AS (JOIN (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" (lambda (x y) (not (equal? x y))) 22) (TRUE))) (AS (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" = 22) (TRUE))) ["t4" (list "id_order" "id_product")])) ["t5" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (AND (TRUE) (BINOP "t5.id_order" = "t5.id_order1"))) ["t2" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (TRUE)
 GROUP-BY (list "t2.id_product" )
 HAVING (TRUE)) ["t3" (list "id_product" "count_id_order")]))
 
(define (q4 tables) 
(SELECT (VALS "t3.id_product" "t3.count_id_order1" )
 FROM (AS (SELECT (VALS "t2.id_product" "t2.id_product1" (VAL-UNOP aggr-count (val-column-ref "t2.id_order1")) )
 FROM (AS (SELECT (VALS "t4.id_order" "t4.id_product" "t4.id_order1" "t4.id_product1" )
 FROM (AS (JOIN (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" (lambda (x y) (not (equal? x y))) 22) (TRUE))) (AS (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" = 22) (TRUE))) ["t5" (list "id_order" "id_product")])) ["t4" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (AND (TRUE) (BINOP "t4.id_order" = "t4.id_order1"))) ["t2" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (TRUE)
 GROUP-BY (list "t2.id_product" "t2.id_product1" )
 HAVING (TRUE)) ["t3" (list "id_product" "id_product1" "count_id_order1")])
 WHERE (TRUE)))
 
(define (q3 tables) 
(SELECT (VALS "t5.id_product" "t5.count_id_product1" )
 FROM (AS (SELECT (VALS "t4.id_product" "t4.id_product1" (VAL-UNOP aggr-count (val-column-ref "t4.id_product1")) )
 FROM (AS (SELECT (VALS "t3.id_order" "t3.id_product" "t3.id_order1" "t3.id_product1" )
 FROM (AS (JOIN (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" (lambda (x y) (not (equal? x y))) 22) (TRUE))) (AS (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" = 22) (TRUE))) ["t2" (list "id_order" "id_product")])) ["t3" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (AND (TRUE) (BINOP "t3.id_order" = "t3.id_order1"))) ["t4" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (TRUE)
 GROUP-BY (list "t4.id_product" "t4.id_product1" )
 HAVING (TRUE)) ["t5" (list "id_product" "id_product1" "count_id_product1")])
 WHERE (TRUE)))
 
(define (q2 tables) 
(AS (SELECT (VALS "t4.id_product" (VAL-UNOP aggr-count (val-column-ref "t4.id_product1")) )
 FROM (AS (SELECT (VALS "t2.id_order" "t2.id_product" "t2.id_order1" "t2.id_product1" )
 FROM (AS (JOIN (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" (lambda (x y) (not (equal? x y))) 22) (TRUE))) (AS (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" = 22) (TRUE))) ["t3" (list "id_order" "id_product")])) ["t2" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (AND (TRUE) (BINOP "t2.id_order" = "t2.id_order1"))) ["t4" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (TRUE)
 GROUP-BY (list "t4.id_product" )
 HAVING (TRUE)) ["t5" (list "id_product" "count_id_product1")]))
 
(define (q1 tables) 
(AS (SELECT (VALS "t3.id_product1" (VAL-UNOP aggr-count (val-column-ref "t3.id_order1")) )
 FROM (AS (SELECT (VALS "t4.id_order" "t4.id_product" "t4.id_order1" "t4.id_product1" )
 FROM (AS (JOIN (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" = 22) (TRUE))) (AS (SELECT (VALS "input.id_order" "input.id_product" )
 FROM (NAMED (list-ref tables 0))
 WHERE (AND (BINOP "input.id_product" (lambda (x y) (not (equal? x y))) 22) (TRUE))) ["t5" (list "id_order" "id_product")])) ["t4" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (AND (TRUE) (BINOP "t4.id_order" = "t4.id_order1"))) ["t3" (list "id_order" "id_product" "id_order1" "id_product1")])
 WHERE (TRUE)
 GROUP-BY (list "t3.id_product1" )
 HAVING (TRUE)) ["t2" (list "id_product1" "count_id_order1")]))

(define ros-instance (list q1 q5 (list t0)))