# Table of contents
1. [Datavectors](#theory_data_vector)
2. [Masks](#masks)
3. [Covariances](#covariance)

## Datavectors <a name="theory_data_vector"></a>

### Cosmology of the `kids_theory_LCDM.modelvector` data vector <a name="theory_data_vector"></a>
    As_1e9: 2.866
    ns: 0.928
    H0: 71.1
    omegab: 0.0455
    omegam: 0.211
    mnu: 0.06
    KIDS_DZ_S1: 0.00
    KIDS_DZ_S2: 0.002
    KIDS_DZ_S3: 0.013
    KIDS_DZ_S4: 0.011
    KIDS_DZ_S5: -0.006
    KIDS_M1: 0.0
    KIDS_M2: 0.0
    KIDS_M3: 0.0
    KIDS_M4: 0.0
    KIDS_M5: 0.0
    KIDS_A1_1: 0.370
    KIDS_A1_2: 0.0
    w: -1.0
    w0pwa: -1.0

### Data Vector Sources and Naming Conventions
   
  All files ending with "AZCL" are computed by members of the [Arizona Cosmology Lab](https://azcosmolab.org), using the Cocoa framework for model vectors and likelihood analyses.
  2PCFs from AZCL were computed using TreeCorr and the data from the KiDS DR4 catalogue.
  The difference between kids_shear_data and kids_shear_data_full is that the "full" array includes the theta values of the bin centers (calculated using rnom convention in TreeCorr--which matches the theta values of the KiDS bins. Both vectors use the same ordering of bin combinations as the KiDS team, which is different from the default ordering of bin combinations by TreeCorr.
    
## Masks <a name="masks"></a>

  The mask `kids_cosmic_shear.mask` corresponds to the original KiDS scale cuts used in (papers here). `kids_cosmic_shear_all.mask` is a stand-in that unmasks all data points.
  The original KiDS scalecuts removed data from the last 2 bins for Xi+ and the first three bins for Xi- 

## Covariances <a name="covariance"></a>

  ACZL covariance was computed using the CosmoLike framework.
  `__` is the covariance from the KiDS team's 4th data release.

## C(l)'s

  Cl_footprint_KiDS_DR4 was calculated using an Nside = 4096 healpix map of the KiDS DR4 footprint, which was created at AZCL using the RAs, Declensions, and star-galaxy flags from the KiDS DR4 catalogue. 

## n(z)'s

  KIDS_NofZ.asc` and `KIDS_NofZ_2.txt` are identical copies except for the file format. The purpose of having a copy is for lens = source simulations where the code may require the lens and source n(z) files to be separate. These n(z) are from the KiDS catalogue: __source ref to go here__
