spool joinmanyrowsin1.log
set feedback off ;
set serveroutput off ;





-- definitions for user-defined aggregate functions
CREATE OR REPLACE TYPE JoinManyRowsIn1Impl AS OBJECT
(
      string varchar2(32767),
      delimiter varchar2(32767),
      static function ODCIAggregateInitialize(sctx IN OUT JoinManyRowsIn1Impl)
       return number,
      member function ODCIAggregateIterate(self IN OUT JoinManyRowsIn1Impl,
        value IN varchar2) return number,
      member function ODCIAggregateTerminate(self IN JoinManyRowsIn1Impl,
        returnValue OUT varchar2, flags IN number) return number,
      member function ODCIAggregateMerge(self IN OUT JoinManyRowsIn1Impl,
        ctx2 IN JoinManyRowsIn1Impl) return number

);
/

CREATE OR REPLACE TYPE BODY JoinManyRowsIn1Impl IS
      static function ODCIAggregateInitialize(sctx IN OUT JoinManyRowsIn1Impl)
      return number is
      begin
        sctx := JoinManyRowsIn1Impl('',',');
        return ODCIConst.Success;
      end;

      member function ODCIAggregateIterate(self IN OUT JoinManyRowsIn1Impl, value IN varchar2)
      return number is
      begin
        if string is not null
        then
               string := string  || delimiter ;
        end if ;
        string := string || value ;
        return ODCIConst.Success;
      end;

      member function ODCIAggregateTerminate(self IN JoinManyRowsIn1Impl, returnValue OUT
      varchar2, flags IN number) return number is
      begin
        returnValue := self.string;
        return ODCIConst.Success;
      end;

      member function ODCIAggregateMerge(self IN OUT JoinManyRowsIn1Impl, ctx2 IN
      JoinManyRowsIn1Impl) return number is
      begin
        return ODCIConst.Success;
      end;

END;
/


CREATE OR REPLACE  FUNCTION JoinManyRowsIn1 (input varchar2) RETURN varchar2
PARALLEL_ENABLE AGGREGATE USING JoinManyRowsIn1Impl;
/



-- Same as above but only allows unique strings to be repeated in the comma seperated list
CREATE OR REPLACE  TYPE JoinManyRowsIn1ImplUniq AS OBJECT
(
      string varchar2(32767),
      delimiter varchar2(32767),
      static function ODCIAggregateInitialize(sctx IN OUT JoinManyRowsIn1ImplUniq)
       return number,
      member function ODCIAggregateIterate(self IN OUT JoinManyRowsIn1ImplUniq,
        value IN varchar2) return number,
      member function ODCIAggregateTerminate(self IN JoinManyRowsIn1ImplUniq,
        returnValue OUT varchar2, flags IN number) return number,
      member function ODCIAggregateMerge(self IN OUT JoinManyRowsIn1ImplUniq,
        ctx2 IN JoinManyRowsIn1ImplUniq) return number

);
/

CREATE OR REPLACE TYPE BODY JoinManyRowsIn1ImplUniq IS
      static function ODCIAggregateInitialize(sctx IN OUT JoinManyRowsIn1ImplUniq)
      return number is
      begin
        sctx := JoinManyRowsIn1ImplUniq('',',');
        return ODCIConst.Success;
      end;

      member function ODCIAggregateIterate(self IN OUT JoinManyRowsIn1ImplUniq, value IN varchar2)
      return number is
      begin
                if string is null or instr (delimiter||string||delimiter, delimiter||value||delimiter) = 0
                then
                if string is not null and string not like '%, '
            then
                       string := string  || delimiter ;
                end if ;
                string := string || value ;
                end if ;

        return ODCIConst.Success;
      end;

      member function ODCIAggregateTerminate(self IN JoinManyRowsIn1ImplUniq, returnValue OUT
      varchar2, flags IN number) return number is
      begin
        returnValue := self.string;
        return ODCIConst.Success;
      end;

      member function ODCIAggregateMerge(self IN OUT JoinManyRowsIn1ImplUniq, ctx2 IN
      JoinManyRowsIn1ImplUniq) return number is
      begin
        return ODCIConst.Success;
      end;

END;
/


CREATE OR REPLACE FUNCTION JoinManyRowsIn1Uniq (input varchar2) RETURN varchar2
PARALLEL_ENABLE AGGREGATE USING JoinManyRowsIn1ImplUniq;
/

-- Same as JoinManyRowsIn1Impl, but creates AND seperated list instead of comma separated list
CREATE OR REPLACE  TYPE JoinManyRowsIn1WithAndImpl AS OBJECT
(
     string varchar2(32767),
     delimiter varchar2(32767),
     static function ODCIAggregateInitialize(sctx IN OUT JoinManyRowsIn1WithAndImpl)
      return number,
     member function ODCIAggregateIterate(self IN OUT JoinManyRowsIn1WithAndImpl,
       value IN varchar2) return number,
     member function ODCIAggregateTerminate(self IN JoinManyRowsIn1WithAndImpl,
       returnValue OUT varchar2, flags IN number) return number,
     member function ODCIAggregateMerge(self IN OUT JoinManyRowsIn1WithAndImpl,
       ctx2 IN JoinManyRowsIn1WithAndImpl) return number

);
/

CREATE OR REPLACE TYPE BODY JoinManyRowsIn1WithAndImpl IS
      static function ODCIAggregateInitialize(sctx IN OUT JoinManyRowsIn1WithAndImpl)
      return number is
      begin
        sctx := JoinManyRowsIn1WithAndImpl('',' AND ');
        return ODCIConst.Success;
      end;

      member function ODCIAggregateIterate(self IN OUT JoinManyRowsIn1WithAndImpl, value IN varchar2)
      return number is
      begin
                if string is not null
        then
               string := string  || delimiter ;
        end if ;
        string := string || value ;
        return ODCIConst.Success;

      end;

      member function ODCIAggregateTerminate(self IN JoinManyRowsIn1WithAndImpl, returnValue OUT
      varchar2, flags IN number) return number is
      begin
        returnValue := self.string;
        return ODCIConst.Success;
      end;

      member function ODCIAggregateMerge(self IN OUT JoinManyRowsIn1WithAndImpl, ctx2 IN
      JoinManyRowsIn1WithAndImpl) return number is
      begin
        return ODCIConst.Success;
      end;

END;
/


CREATE OR REPLACE FUNCTION JoinManyRowsIn1WithAnd (input varchar2) RETURN varchar2
PARALLEL_ENABLE AGGREGATE USING JoinManyRowsIn1WithAndImpl;
/

show errors ;
commit ;

