{ den, ... }:
{
  den.aspects.alice = {
    includes = [
      (
        {
          HM,
          user,
          host,
          ...
        }:
        let
          unused = den.lib.take.unused [
            HM
            user
            host
          ];
        in
        {
          homeManager.manual.html.enable = unused true;
        }
      )
    ];
  };

  perSystem =
    { checkCond, alice-at-rockhopper, ... }:
    {
      checks.alice-hm-manual-html-enabled-by-parametric-user = checkCond "parametric home-managed manual html for alice" (
        alice-at-rockhopper.manual.html.enable
      );
    };
}
