class implementation NMnonmanigm;

#include "OMmacros.h"

extern struct NMgmssi_cache NMnonmanigm_ssi_cache;

method NMput_SSI(IGRlong *EMmsg; struct NMgmSSI *ssi)
{
 IGRlong	sts = OM_S_SUCCESS;
 IGRint		j, i, total_edgesout = 0, thisnm_numedgesin = 0, num_idx = 0, 
		ids_idx = 0, total_ids = 0;
 struct NMentities *this_nm;


 *EMmsg = EMS_S_Success;

 for(j=0; j<ssi->num_sfs; j++)
  {
   total_ids += ssi->nmentities[j].num_flps;
   total_ids += ssi->nmentities[j].num_vtxuses;
   total_ids += ssi->nmentities[j].num_edges;
   total_ids += ssi->nmentities[j].numedgesout;
   total_edgesout += ssi->nmentities[j].numedgesout;
   total_ids += ssi->nmentities[j].numedgesrev;
   for(i=0; i<ssi->nmentities[j].numedgesout; i++)
    total_ids += ssi->nmentities[j].numedgesin[i];
   total_ids += (ssi->nmentities[j].numvtxusechg * 3);
   total_ids += (ssi->nmentities[j].numvtxusetr * 3);
   total_ids += (ssi->nmentities[j].numedcon * 2);
   total_ids += (ssi->nmentities[j].numeddiscon * 2);
  }

 total_ids += (ssi->num_nmedges + ssi->num_vtx);

 sts = om$vla_set_dimension(varray = ME.NMnonmanigm->sfid, size = ssi->num_sfs);
 sts = om$vla_set_dimension(varray = ME.NMnonmanigm->num, 
                            size = (ssi->num_sfs * 9) + total_edgesout);

 sts = om$vla_set_dimension(varray = ME.NMnonmanigm->ids, 
                            size =total_ids);

 ME.NMnonmanigm->num_sfs = ssi->num_sfs;
 ME.NMnonmanigm->num_nmedges = ssi->num_nmedges;
 ME.NMnonmanigm->num_vtx = ssi->num_vtx;

 for(j=0; j<ssi->num_sfs; j++)
  {
   this_nm = (struct NMentities *) &ssi->nmentities[j];
   sts = NMtag(EMmsg, &this_nm->sfid, &ME.NMnonmanigm->sfid[j], TRUE);
   if(!(1&*EMmsg&sts)) goto wrapup;

   /*ME.NMnonmanigm->sfid[j] = this_nm->sfid;*/
   ME.NMnonmanigm->num[num_idx++] = this_nm->num_flps;
   ME.NMnonmanigm->num[num_idx++] = this_nm->num_vtxuses;
   ME.NMnonmanigm->num[num_idx++] = this_nm->num_edges;
   ME.NMnonmanigm->num[num_idx++] = this_nm->numedgesrev;
   ME.NMnonmanigm->num[num_idx++] = this_nm->numedgesout;
   thisnm_numedgesin = 0;
   for(i=0; i<this_nm->numedgesout; i++)
    {
     ME.NMnonmanigm->num[num_idx++] = this_nm->numedgesin[i];
     thisnm_numedgesin += this_nm->numedgesin[i];
    }
   ME.NMnonmanigm->num[num_idx++] = this_nm->numvtxusechg;
   ME.NMnonmanigm->num[num_idx++] = this_nm->numvtxusetr;
   ME.NMnonmanigm->num[num_idx++] = this_nm->numedcon;
   ME.NMnonmanigm->num[num_idx++] = this_nm->numeddiscon;

   if(this_nm->num_flps)
    {
     OM_BLOCK_MOVE(this_nm->flps, &ME.NMnonmanigm->ids[ids_idx], 
                  this_nm->num_flps * sizeof(GRobjid));
     ids_idx += this_nm->num_flps;
    }

   if(this_nm->num_vtxuses)
    {
     OM_BLOCK_MOVE(this_nm->vtxuses, &ME.NMnonmanigm->ids[ids_idx], 
                  this_nm->num_vtxuses * sizeof(GRobjid));
     ids_idx += this_nm->num_vtxuses;
    }

   if(this_nm->num_edges)
    {
     OM_BLOCK_MOVE(this_nm->edges, &ME.NMnonmanigm->ids[ids_idx], 
                  this_nm->num_edges * sizeof(GRobjid));
     ids_idx += this_nm->num_edges;
    }

   if(this_nm->numedgesrev)
    {
     OM_BLOCK_MOVE(this_nm->edgesrev, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numedgesrev * sizeof(GRobjid));
     ids_idx += this_nm->numedgesrev;
    }

   if(this_nm->numedgesout)
    {
     OM_BLOCK_MOVE(this_nm->edgesout, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numedgesout * sizeof(GRobjid));
     ids_idx += this_nm->numedgesout;
    }

   if(thisnm_numedgesin)
    {
     OM_BLOCK_MOVE(this_nm->edgesin, &ME.NMnonmanigm->ids[ids_idx],
                  thisnm_numedgesin * sizeof(GRobjid));
     ids_idx += thisnm_numedgesin;
    }

   if(this_nm->numvtxusechg)
    {
     OM_BLOCK_MOVE(this_nm->vtxusechg, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numvtxusechg * sizeof(GRobjid));
     ids_idx += this_nm->numvtxusechg;
     OM_BLOCK_MOVE(this_nm->origedges, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numvtxusechg * sizeof(GRobjid));
     ids_idx += this_nm->numvtxusechg;
     OM_BLOCK_MOVE(this_nm->repledges, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numvtxusechg * sizeof(GRobjid));
     ids_idx += this_nm->numvtxusechg;
    }

   if(this_nm->numvtxusetr)
    {
     OM_BLOCK_MOVE(this_nm->vtxusetr, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numvtxusetr * sizeof(GRobjid));
     ids_idx += this_nm->numvtxusetr;
     OM_BLOCK_MOVE(this_nm->origvtx, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numvtxusetr * sizeof(GRobjid));
     ids_idx += this_nm->numvtxusetr;
     OM_BLOCK_MOVE(this_nm->replvtx, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numvtxusetr * sizeof(GRobjid));
     ids_idx += this_nm->numvtxusetr;
    }

   if(this_nm->numedcon)
    {
     OM_BLOCK_MOVE(this_nm->edcon, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numedcon * sizeof(GRobjid));
     ids_idx += this_nm->numedcon;
     OM_BLOCK_MOVE(this_nm->nmedgescon, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numedcon * sizeof(GRobjid));
     ids_idx += this_nm->numedcon;
    }

   if(this_nm->numeddiscon)
    {
     OM_BLOCK_MOVE(this_nm->eddiscon, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numeddiscon * sizeof(GRobjid));
     ids_idx += this_nm->numeddiscon;
     OM_BLOCK_MOVE(this_nm->nmedgesdiscon, &ME.NMnonmanigm->ids[ids_idx],
                  this_nm->numeddiscon * sizeof(GRobjid));
     ids_idx += this_nm->numeddiscon;
    }

  } /* for(j=0; j<ssi->num_sfs; j++) */


 if(ssi->num_nmedges)
  {
   OM_BLOCK_MOVE(ssi->nmedges, &ME.NMnonmanigm->ids[ids_idx], 
                 ssi->num_nmedges * sizeof(GRobjid));
   ids_idx += ssi->num_nmedges;
  }

 if(ssi->num_vtx)
  {
   OM_BLOCK_MOVE(ssi->vtx, &ME.NMnonmanigm->ids[ids_idx], 
                 ssi->num_vtx * sizeof(GRobjid));
   ids_idx += ssi->num_vtx;
  }

 NMnonmanigm_ssi_cache.is_valid = FALSE;
 NMnonmanigm_ssi_cache.elemid.objid = NULL_OBJID;

wrapup:
EMWRAPUP(*EMmsg, sts, "NMnonmanigm.NMput_SSI");
return(sts);
}

end implementation NMnonmanigm;
