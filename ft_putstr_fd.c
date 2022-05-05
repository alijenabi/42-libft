/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alijenabi <alijenabi@student.42.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/26 18:00:18 by alijenabi         #+#    #+#             */
/*   Updated: 2022/05/05 15:31:24 by alijenabi        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <unistd.h>

/**
 * Outputs the string 's' to the given file desciptor.
 * @param s[in]   The string to output.
 * @param fd[in]  The file descriptor on which to write.
 */
void	ft_putstr_fd(char *s, int fd)
{
	if (!s)
		return ;
	while (*s)
		ft_putchar_fd(*(s++), fd);
}
