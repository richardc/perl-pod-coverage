#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#define _CvGV(cv)                                       \
        (SvROK(cv) && (SvTYPE(SvRV(cv))==SVt_PVCV)      \
         ? SvREFCNT_inc(CvGV((CV*)SvRV(cv))) : &PL_sv_undef)

MODULE = Pod::Coverage    PACKAGE = Pod::Coverage PREFIX = pc

SV *
pc_CvGV(self, cv)
    SV *self
    SV *cv
 	CODE: 
		RETVAL = _CvGV(cv);
	OUTPUT:
		RETVAL
