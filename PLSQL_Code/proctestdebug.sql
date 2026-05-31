BEGIN
  -- Create an ACL (ignore error if it already exists; see note below)
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
    acl         => 'jdwp_debug_acl.xml',
    description => 'Allow JDWP debugging from SQL Developer',
    principal   => 'HR',
    is_grant    => TRUE,
    privilege   => 'connect'
  );

  -- Allow localhost (both forms)
  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
    acl  => 'jdwp_debug_acl.xml',
    host => '127.0.0.1'
  );

  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
    acl  => 'jdwp_debug_acl.xml',
    host => 'localhost'
  );
END;
/
COMMIT;





CREATE OR REPLACE PROCEDURE demo_debug
IS
  v_a NUMBER := 5;
  v_b NUMBER := 10;
  v_sum NUMBER;
BEGIN
  v_sum := v_a + v_b;        -- breakpoint here

  IF v_sum > 10 THEN
    v_sum := v_sum * 2;      -- step into IF
  END IF;

  DBMS_OUTPUT.PUT_LINE('Result = ' || v_sum);
END;
/
