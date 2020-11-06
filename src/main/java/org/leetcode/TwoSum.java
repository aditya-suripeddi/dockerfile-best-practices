package org.leetcode;

import static java.lang.System.out;

public class TwoSum {

    public static void main(String[] args)
    {
        int target = 4 ;
        int[] nums = {1, 2, 2, 3} ;

        boolean ans = false ;
        int i, j;

        for(i=0 ; i < nums.length && !ans ; i++)
            for(j= i+1; j < nums.length ; j++ )
                 if( nums[i] + nums[j] == target)
                 {
                     out.println(" [" + nums[i] + ", " + nums[j] + "]");
                     ans = true;
                 }
    }
}
