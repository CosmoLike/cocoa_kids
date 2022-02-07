from cobaya.likelihoods.kids._cosmolike_prototype_base import _cosmolike_prototype_base
import cosmolike_kids_interface as ci
import numpy as np

class kids_cosmic_shear(_cosmolike_prototype_base):
  # ------------------------------------------------------------------------
  # ------------------------------------------------------------------------
  # ------------------------------------------------------------------------

  def initialize(self):
    super(kids_cosmic_shear,self).initialize(probe="xi")

  # ------------------------------------------------------------------------
  # ------------------------------------------------------------------------
  # ------------------------------------------------------------------------

  def logp(self, **params_values):

    if self.create_baryon_pca:
      self.generate_baryonic_PCA(**params_values)
      self.force_cache_false = True

    self.set_cosmo_related()

    if self.create_baryon_pca:
      self.force_cache_false = False

    self.set_source_related(**params_values)

    # datavector C++ returns a list (not numpy array)
    datavector = np.array(ci.compute_data_vector_masked())

    if self.use_baryon_pca:
      # Warning: we assume the PCs were created with the same mask
      # We have no way of testing user enforced that
      self.set_baryon_related(**params_values)
      datavector = self.add_baryon_pcs_to_datavector(datavector)

    # PRINT DATAVECTOR
    print(datavector)

    # SAVE DATAVECTOR
    np.savetxt("./projects/kids/data/kids_theory_maxmarg",datavector)

    return self.compute_logp(datavector)
