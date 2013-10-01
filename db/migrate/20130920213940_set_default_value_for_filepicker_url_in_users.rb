class SetDefaultValueForFilepickerUrlInUsers < ActiveRecord::Migration
  def change
    change_column :users, :filepicker_url, :string, default: "https://s3-us-west-2.amazonaws.com/nicole-brent-wedding/GxVNWoGwRmODnIqlR0Mh_placeholder.svg?AWSAccessKeyId=ASIAI7YSG2U6WS66VLDQ&Expires=1379712575&Signature=dyEg/n8e98sr0LiH0gL5rj//SLk%3D&x-amz-security-token=AQoDYXdzEK///////////wEawALmqII%2BCWRvuTfrndPsweez4j7Tmw300SofTFfAWAQ8Sr4cGTVRsFzGGkRzxENeMeiZ7YediPjOoVuoTZA4CwElzzGRcqquJjHWUj322pA6JWK0OMDGGvTbcDxUTva7Gu7K3Eiszoenh3Ah7i/DHYPpSSAivQkp18RcD5UxQwiLwd/Sq7GrZn0fpqbhN%2Bmtt9Mq%2BTQV4/%2Bd2R1NOGzFvyoDf2/chUKd5SRJHjqIiP64WLpdJQIyTLSH7oqP0919lCd2F8mdbfZsyUJKCXQrFutbDbvp6HJkluwotNrpPYzXVtqEe2QIg6sfhchBlM8ZF13lEOZhpqjQ4zQrwvzvDh0e66VESkOISFvNZDhceVF/CPad8WC89pg9Rcw3O8W5mB9E15YrFunH6TMuTf5rwJV963mdzw7lr%2BZi5GVS4I2MPCDh%2BfKRBQ%3D%3D"
  end
end
